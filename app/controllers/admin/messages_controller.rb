class Admin::MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.build(message_params)
    @message.dono = current_admin

    if @message.save
      redirect_to admin_chat_path(@chat)
    else
      render "admin/chats/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
