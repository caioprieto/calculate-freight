class CartController < ApplicationController
  def add
    @cart.cart_cursos.create(curso_id: params[:curso_id])

    redirect_to user_carrinho_path if params[:redirect].present?
  end

  def remove
    @cart.cart_cursos.where(curso_id: params[:curso_id]).last.destroy

    redirect_to user_carrinho_path
  end
end
