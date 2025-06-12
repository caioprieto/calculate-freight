class User::WordsController < ApplicationController
  layout "proposta"

  def proposta
    @word = Word.find(params[:id])
    @chat = Chat.find_or_create_by!(
                    user_word_id: current_user.user_words.where(word_id: @word.id).first.id
                  )
    @messages = @chat.messages
  end

  def new
    @tema = Tema.new
  end

  def create
    @tema = Tema.new(tema_params)

    # Captura os links enviados do formulário como array
    if params[:tema][:links]
      @tema.links = params[:tema][:links].reject(&:blank?) # Remove vazios
    end

    if @tema.save
      redirect_to @tema, notice: "Tema criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def tema_params
    params.require(:tema).permit(:titulo, :imagem, :texto_motivador)
  end
end
