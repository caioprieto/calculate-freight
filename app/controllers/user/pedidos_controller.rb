class User::PedidosController < ApplicationController
  layout "user_dashboard"

  def index
    @user = current_user
    @pedidos = @user.pedidos.order(updated_at: :desc)
  end
end
