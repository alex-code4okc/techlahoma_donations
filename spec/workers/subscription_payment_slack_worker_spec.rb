require 'rails_helper'
RSpec.describe SubscriptionPaymentSlackWorker, type: :worker do
  before :each do
    Sidekiq::Testing.inline!
  end
  let(:worker){ SubscriptionPaymentSlackWorker.new }
  describe "perform" do
    it "should call the Chat service" do
      donation = create :donation
      expect(Chat).to receive(:slack_message).and_return(nil)
      worker.perform(donation.id)
    end
  end
end
