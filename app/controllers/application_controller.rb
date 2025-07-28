class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :authenticate_user!
  before_action :set_cart, if: -> { current_user.present? }

  def set_cart
    @cart = Cart.find_or_create_by(user: current_user)
    @cursos = @cart.cursos.order(value: :desc)
  end
end
