# app/controllers/payments_controller.rb
class PaymentsController < ApplicationController
  before_action :set_cart, only: %i[create_checkout_session success]

  def create_checkout_session
    cart = Cart.find(params[:cart_id])
    product_name = cart.cursos.first.name

    session = Stripe::Checkout::Session.create({
      payment_method_types: [ "card" ],
      line_items: [ {
        price_data: {
          currency: "brl",
          product_data: {
            name: product_name
          },
          unit_amount: (cart.total * 100).to_i
        },
        quantity: 1
      } ],
      mode: "payment",
      success_url: "#{root_url}success?session_id={CHECKOUT_SESSION_ID}&show_modal=true",
      cancel_url: "#{root_url}cancel"
    })

    redirect_to session.url, allow_other_host: true
  end

  def success
    create_pedido(@cart)
    redirect_to user_carrinho_path(show_modal: true, code: "07ILR5LK")
  end

  def cancel
    redirect_to user_carrinho_path
  end

  private

  def create_pedido(cart)
    pedido_params = {
      cart_id: cart.id,
      user_id: current_user.id,
      cursos_count: cart.cursos.count,
      total: cart.total
    }

    Pedido.create(pedido_params)
  end
end
