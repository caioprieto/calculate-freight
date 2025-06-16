class Admin::WordsController < AdminsBackofficeController
  def index
    @redacoes = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    Word.create(tema: params[:word][:tema], word_type: params[:word][:word_type])
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])

    if @word.update(word_params)
      redirect_to edit_admin_word_path(@word), notice: "Curso atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new 
    @word = Word.new
  end
  def create
    @word = Word.create(word_params)

  end
  private

  def word_params
    params.permit(:pdf_file, :tema, :word_type, :introducao)
  end
  
end
