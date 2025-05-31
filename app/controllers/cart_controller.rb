class CartController < ApplicationController
  def add
    if @cart.cart_cursos.exists?(curso_id: params[:curso_id])
      flash[:alert] = "Este curso já está no seu carrinho!"
    else
      cart = @cart.cart_cursos.build(curso_id: params[:curso_id])

      if cart.save
        flash[:notice] = "Curso adicionado ao carrinho com sucesso!"
      else
        flash[:alert] = "Este curso já foi comprado!"
      end
    end

    redirect_to user_carrinho_path if params[:redirect].present?
  end

  def remove
    @cart.cart_cursos.where(curso_id: params[:curso_id]).last.destroy

    redirect_to user_carrinho_path
  end
end
