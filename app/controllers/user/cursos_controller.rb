class User::CursosController < ApplicationController
  layout "player"

  def player
    @curso = Curso.find(params[:id])
    @modulos = @curso.modulos
    @user_curso = current_user.user_cursos.where(curso_id: params[:id]).first
  end
end
