class CartController < ApplicationController
  def add
    if @cart.cart_cursos.exists?(curso_id: params[:curso_id])
      flash[:alerta] = "Este curso já está no seu carrinho!"
    else
      cart = @cart.cart_cursos.build(curso_id: params[:curso_id])

      if cart.save
        flash[:noticia] = "Curso adicionado ao carrinho com sucesso!"
      else
        flash[:alerta] = "Este curso já foi comprado!"
      end
    end

    redirect_back fallback_location: root_path, allow_other_host: false
  end

  def remove
    @cart.cart_cursos.where(curso_id: params[:curso_id]).last.destroy

    redirect_back fallback_location: root_path, allow_other_host: false
    flash[:alerta] = "Curso removido do carrinho com sucesso!"
  end
end
