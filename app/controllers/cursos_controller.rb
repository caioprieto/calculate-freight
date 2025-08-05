class CursosController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index edit]
  layout "application"
  def index
    @prova = params[:prova]
    @cursos = Curso.where(prova: @prova)
    @title_page = "Cursos"
  end

  def edit
    @curso = ::Curso.find(params[:id])
    @modulos = @curso.modulos
    @title_page = "Cursos"
  end
end
