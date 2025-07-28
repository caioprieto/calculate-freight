class Admin::ChatsController < AdminsBackofficeController
  def messages
    @chat = Chat.find(params[:id])
    render partial: "admin/chats/messages", locals: { chat: @chat }
  end
end
