class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :authenticate_user!
  before_action :set_cart, if: -> { current_user.present? }

  def set_cart
    @cart = current_user.cart
    @cursos = @cart.cursos
  end
end
