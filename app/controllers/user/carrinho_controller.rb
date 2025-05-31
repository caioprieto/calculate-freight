class User::CarrinhoController < ApplicationController
  layout "user_dashboard"

  def index
    @cart = current_user.cart
    @cursos = @cart.cursos
    @code = params[:code]
  end
end
