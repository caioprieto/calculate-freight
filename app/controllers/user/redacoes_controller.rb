class User::RedacoesController < ApplicationController
  layout "user_dashboard"

  def index
    @redacoes = current_user.words
  end

  def search
    debugger
  end
end
