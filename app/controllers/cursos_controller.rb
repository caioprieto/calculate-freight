class CursosController < ApplicationController
  skip_before_action :authenticate_user!, only: :edit
  layout "application"
  def index
  end

  def new
  end

  def edit
    @curso = ::Curso.find(params[:id])
    @modulos = @curso.modulos
  end
end
