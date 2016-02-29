class Donation < ActiveRecord::Base

  include GuidIds

  validates :email, :presence => true

  def donor_name
    name.blank? ? "An Anonymous Donor" : name
  end
  # Ideally the process of charging a card would happen
  # in the bakground and in a service object of some sort.
  # This is the quick and dirty method that doesn't require background workers.
  before_create :populate_plan_data, :charge_the_token
  after_create :send_thank_you_email, :notify_slack, :notify_techlahomies

  def populate_plan_data
    plan = Plan.find(plan_id)
    return unless plan
    self.plan_name = plan[:name]
    self.amount = plan[:cost_in_dollars_per_year]
  end


  def charge_the_token
    charge = Stripe::Charge.create(
      amount:      (amount * 100).to_i,
      currency:    "usd",
      card:        token_id,
      description: email
    )
    self.stripe_id = charge["id"]
    self.stripe_status = charge["status"]
    self.stripe_response = charge.to_json
  end

  def send_thank_you_email
    DonationMailer.thank_you_email(self).deliver_later
  end

  def notify_slack
    Chat.slack_message("New Donation: $#{self.amount.to_i} by #{self.email}")
  end

  def notify_techlahomies
    #p 'email techlahoma@gmail.com about donation posting'
  end

end
