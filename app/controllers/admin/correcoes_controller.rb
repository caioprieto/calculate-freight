class Admin::CorrecoesController < AdminsBackofficeController
  def index
    @alunos = User.joins(:user_words).distinct

    @correcoes = UserWord.concluidas
    @correcoes = @correcoes.por_aluno(params[:aluno]) if params[:aluno].present?
    @correcoes = @correcoes.por_prova(params[:prova]) if params[:prova].present?
    @correcoes = @correcoes.por_periodo(params[:data_inicial].presence && Date.parse(params[:data_inicial]), params[:data_final].presence && Date.parse(params[:data_final])) if params[:data_inicial].present? || params[:data_final].present?

    case params[:order_by]
    when "apertados"
      @correcoes = @correcoes.ordenado_por_apertados
    when "melhores"
      @correcoes = @correcoes.ordenado_por_melhores
    else
      @correcoes = @correcoes.order(data_conclusao: :asc)
    end
  end

  def alunos
    users = User.select(:id, :nome).where("nome ILIKE ?", "%#{params[:name]}%")

    render json: users.map { |u| { id: u.id, text: u.nome } }
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

  def edit
    @user_word = UserWord.find(params[:id])
  end
end
