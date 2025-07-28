class Admin::AlunosController < AdminsBackofficeController
  def index
    @alunos = ::User.includes(:user_words, :notifications)
                    .where.not(
                      id: Notification.where(painel: "admin").select(:user_id)
                    )

    @alunos_notifications = ::User.includes(:user_words, :notifications)
                                  .joins(:notifications)
                                  .where(notifications: { painel: "admin" })

    if params[:query].present?
      @alunos = @alunos.where("users.nome ILIKE ?", "%#{params[:query]}%")
    end

    if params[:aluno_id].present?
      @aluno_selecionado = @alunos.find_by(id: params[:aluno_id]) || @alunos_notifications.find_by(id: params[:aluno_id])
      @chats = @aluno_selecionado&.user_words&.map(&:chat)&.compact&.uniq || []
    end

    if params[:chat_id].present?
      @chat_selecionado = Chat.includes(:messages).find_by(id: params[:chat_id])
    end
  end

  def notifications
    aluno = User.find(params[:id])
    chat_notifications = aluno.notifications.where(painel: "admin").group(:chat_id).count
    total_notifications = aluno.notifications.where(painel: "admin").count

    render json: {
      total: total_notifications,
      chats: chat_notifications
    }
  end

  def adicionar_cursos
    @aluno = User.find(params[:aluno_id])
    curso = Curso.find(params[:curso_id])

    if curso.present?
      @aluno.user_cursos.find_or_create_by(data_inicio: Time.zone.now, user_id: @aluno.id, curso: curso, data_fim: Time.zone.now + curso.vigencia.months)
      flash[:notice] = "Curso adicionado com sucesso!"
    else
      flash[:alert] = "Selecione um curso válido."
    end

    redirect_to admin_alunos_path(aluno_id: @aluno.id, cursos: true)
  end

  def adicionar_words
    @aluno = User.find(params[:aluno_id])
    word_id = params[:word_id]

    if word_id.present?
      @user_word = @aluno.user_words.find_or_create_by(user_id: @aluno.id, word_id: word_id)

      flash[:notice] = "Curso adicionado com sucesso!"
    else
      flash[:alert] = "Selecione um curso válido."
    end

    redirect_to admin_alunos_path(aluno_id: @aluno.id, redacoes: true)
  end

  def alterar_vigencia
    user_curso = UserCurso.find(params[:id])

    if user_curso.update(data_fim: params[:data_fim].to_datetime.change(hour: 12))
      redirect_back fallback_location: admin_alunos_path, notice: "Vigência atualizada!"
    else
      redirect_back fallback_location: admin_alunos_path, alert: "Erro ao atualizar."
    end
  end
end
