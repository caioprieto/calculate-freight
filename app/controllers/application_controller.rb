class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :authenticate_user!
  before_action :set_cart, if: -> { current_user.present? }

  def set_cart
    if current_user.cart.present?
      @cart = current_user.cart
      @cursos = @cart.cursos
    else
      @cart = Cart.create(user: current_user)
      @cursos = @cart.cursos
    end
  end
end
