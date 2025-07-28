class Admin::MessagesController < AdminsBackofficeController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.build(message_params)
    @message.dono = current_admin
    @message.save

    # Notification.create(user_id: user_id, title: "Novo curso disponível!", body: "#{curso.name.upcase} já está liberado na área do aluno", notification_type: "add_curso")

    redirect_to admin_alunos_path(aluno_id: @chat.user_word.user_id, chat_id: @chat.id, anchor: "bottom")
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
