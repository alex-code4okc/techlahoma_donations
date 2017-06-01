Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key:      ENV['STRIPE_SECRET_KEY'],
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]

StripeEvent.configure do |events|
  events.all do |event|
    Rails.logger.debug "Stripe Event: #{event.type}:#{event.id}"
    # Handle all event types - logging, etc.
  end

  events.subscribe 'invoice.payment_succeeded', StripeInvoicePaymentSucceeded.new
end
