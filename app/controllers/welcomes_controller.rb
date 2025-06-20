class WelcomesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index apresentacao]

  def index
    set_cursos
  end

  def apresentacao
  end

  private

  def set_cursos
    @cursos ||= Curso.all.limit(5)
  end
end
