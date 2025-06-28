class WelcomesController < ApplicationController
  layout "welcome"
  skip_before_action :authenticate_user!, only: %i[index apresentacao acesso_livre temas]

  def index
    set_cursos
  end

  def apresentacao
  end

  def acesso_livre
  end

  def temas
  end

  private

  def set_cursos
    @cursos ||= Curso.all.limit(5)
  end
end
