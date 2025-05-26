class WelcomesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    set_cursos
  end

  private

  def set_cursos
    @cursos ||= Curso.all.limit(5)
  end
end
