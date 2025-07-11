class Admin::MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.build(message_params)
    @message.dono = current_admin

    if @message.save
      render json: {
        id: @message.id,
        content: @message.content,
        dono_type: @message.dono_type
      }
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
