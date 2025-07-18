class WelcomesController < ApplicationController
  layout "welcome"
  skip_before_action :authenticate_user!, only: %i[index apresentacao acesso_livre temas cursos]

  def index
    set_cursos
  end

  def apresentacao
  end

  def acesso_livre
  end

  def temas
    @temas_collection = ::Tema.all

    if params[:prova].present?
      @temas_collection = ::Tema.find_by_prova(params[:prova])
    end
  end

  def cursos
    @cursos_collection = ::Curso.all

    if params[:prova].present?
      @cursos_collection = ::Curso.find_by_prova(params[:prova])
    end
  end

  private

  def set_cursos
    @cursos ||= Curso.all.limit(5)
  end
end
