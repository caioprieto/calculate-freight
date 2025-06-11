class User::WordsController < ApplicationController
  layout "proposta"

  def proposta
    @word = Word.find(params[:id])
  end
end
