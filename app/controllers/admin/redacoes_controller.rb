class Admin::RedacoesController < AdminsBackofficeController
  def index
    @redacoes = Word.all
  end

  def edit
    @redacao = Word.find(params[:id])
  end
end
