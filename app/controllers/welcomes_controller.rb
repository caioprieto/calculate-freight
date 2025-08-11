class WelcomesController < ApplicationController
  layout "welcome"
  skip_before_action :authenticate_user!, only: %i[index apresentacao acesso_livre temas cursos]

  def index
    set_cursos
  end

  def apresentacao
    @title_page = "Quem somos"
  end

  def acesso_livre
    @title_page = "Acesso Livre"
  end

  def temas
    @title_page = "Temas de Redação"
    @temas_collection = ::Tema.all

    if params[:prova].present?
      @temas_collection = ::Tema.find_by_prova(params[:prova])
    end

    if current_user
      @favoritos_ids = current_user.favoritos.pluck(:tema_id)
    else
      @favoritos_ids = []
    end
  end

  def cursos
    @title_page = "Cursos"
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
