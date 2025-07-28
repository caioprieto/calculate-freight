class User::MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.build(message_params)
    @message.dono = current_user

    @word = @chat.user_word.word

    if @message.save
      redirect_to proposta_user_word_path(@word)

      ::Notification.create!(
          user_id: current_user.id,
          painel: "admin", title: "Mensagem de #{current_user.nome}",
          body: "#{@message.content}", notification_type: "message",
          chat_id: @chat.id
      )
    else
      render "chat/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
