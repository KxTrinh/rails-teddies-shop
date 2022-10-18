Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key:      ENV['STRIPE_SECRET_KEY'],
  signing_secret:  ENV['STRIPE_WEBHOOK_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

StripeEvent.signing_secret = Rails.configuration.stripe[:signing_secret]

# StripeEvent.configure do |events|
#   events.subscribe 'checkout.session.completed', StripeCheckoutSessionService.new
# end

StripeEvent.configure do |events|
  events.subscribe 'checkout.session.completed' do |event|
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'paid')
  end
end

# class StripeCheckoutSessionService
#   def call(event)
#     order = Order.find_by(checkout_session_id: event.data.object.id)
#     order.update(state: 'paid')
#   end
# end
