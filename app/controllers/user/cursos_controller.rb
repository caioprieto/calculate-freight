class User::CursosController < ApplicationController
  layout "player"

  def player
    @curso = current_user.cursos.where(id: params[:id]).first

    return redirect_to user_dashboard_path if @curso.blank?

    @modulos = @curso.modulos
    @user_curso = current_user.user_cursos.where(curso_id: params[:id]).first
  end
end
