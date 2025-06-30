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

  def save_user_word_pdf
    @word = Word.find(params[:id])
    @user_word = current_user.user_words.where(word_id: @word.id).first

    if params[:file].present?
      if @user_word.user_redacao.attach(params[:file])
        redirect_to proposta_user_word_path(@user_word.word_id), notice: "Redação enviada com sucesso."
        @user_word.update(concluido: true, data_conclusao: Time.zone.now)
      end
    else
      redirect_back fallback_location: root_path, alert: "Arquivo não selecionado."
    end
  end
end
