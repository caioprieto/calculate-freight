class User::CursosController < ApplicationController
  layout "player"

  def player
    @user_curso = current_user.user_cursos
                              .ativos
                              .where(curso_id: params[:id])
                              .first

    @curso = current_user.cursos
                         .where(id: params[:id])
                         .first

    return redirect_to user_dashboard_path if @curso.blank? || @user_curso.blank?
    @modulos = @curso.modulos
  end
end
