class User::WordsController < ApplicationController
  layout "proposta"

  def proposta
    @word = Word.find(params[:id])
    @chat = Chat.find_or_create_by!(
                    user_word_id: current_user.user_words.where(word_id: @word.id).first.id
                  )
    @messages = @chat.messages
  end
end
