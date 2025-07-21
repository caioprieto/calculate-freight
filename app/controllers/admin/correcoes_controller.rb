class Admin::CorrecoesController < AdminsBackofficeController
  def index
    @alunos = User.joins(:user_words).uniq
    @correcoes = UserWord.where(concluido: true, corrigido: false).order(data_conclusao: :desc)
  end

  def enviar_correcao
    @user_word = UserWord.find(params[:user_word_id])

    if params[:file].present?
      if @user_word.correcao.attach(params[:file]) && @user_word.update(corrigido: true)
        redirect_to admin_correcoes_path, notice: "Redação enviada com sucesso."
      end
    else
      redirect_back fallback_location: root_path, alert: "Arquivo não selecionado."
    end
  end
end
