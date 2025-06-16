class User::MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.build(message_params)
    @message.dono = current_user || current_admin
    @word = @chat.user_word.word

    if @message.save
      redirect_to proposta_user_word_path(@word)
    else
      render "chat/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
