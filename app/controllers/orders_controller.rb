class OrdersController < ApplicationController
  def create
    teddy = Teddy.find(params[:teddy_id])
    order  = Order.create!(teddy: teddy, teddy_sku: teddy.sku, amount: teddy.price, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'eur',
          unit_amount: teddy.price_cents,
          product_data: {
            name: teddy.sku,
            description: 'Comfortable cotton teddy',
            images: [teddy.photo_url],
          },
        },
        quantity: 1,
      }],
      mode: 'payment',

      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

end
