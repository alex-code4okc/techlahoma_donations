require "rails_helper"

RSpec.describe DonationMailer, type: :mailer do
  describe "thank_you_email" do
    let(:donation){ create :donation }
    let(:mail) { DonationMailer.thank_you_email(donation) }

    it "renders the headers" do
      expect(mail.subject).to eq("Thanks for donating to Techlahoma!")
      expect(mail.to).to eq([donation.email])
      expect(mail.from).to eq(["donate@techlahoma.org"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Thank you for supporting Techlahoma.")
    end
  end
end
