class Admin::WordsController < AdminsBackofficeController
  def index
    @redacoes = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    if @word = Word.create(word_params)
      redirect_to admin_words_path
    end
  end

  def edit
    @word = Word.find(params[:id])
  end
  
  def update
    @word = Word.find(params[:id])

    if @word.update(word_params)
      flash[:alerta] = "REDAÇÃO ALTERADA COM SUCESSO"
      redirect_to edit_admin_word_path(@word), notice: "Curso atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def word_params
    params.require(:word).permit(:pdf_file, :tema, :word_type, :introducao)
  end
  
end
