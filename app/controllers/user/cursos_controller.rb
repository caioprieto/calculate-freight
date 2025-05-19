class User::CursosController < ApplicationController
  layout "player"

  def player
    @curso = Curso.find(params[:id])
  end
end
