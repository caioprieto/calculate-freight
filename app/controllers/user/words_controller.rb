class User::WordsController < ApplicationController
  layout "proposta"

  def proposta
    @word = Word.find(params[:id])
    @user_word = current_user.user_words.where(word_id: @word.id).first
    @user_curso = current_user.user_cursos.where(curso_id: @user_word.curso_id).first
    @chat = Chat.find_or_create_by!(
                    user_word_id: @user_word.id,
                  )
    @messages = @chat.messages
  end

  def save_timer
    debugger
  end
end
