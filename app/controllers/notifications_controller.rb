# app/controllers/notifications_controller.rb
class NotificationsController < ApplicationController
  before_action :set_notification, only: [ :marcar_leitura ]

  def marcar_leitura
    @notification.update(read: true)
    redirect_back fallback_location: root_path, notice: "Notificação marcada como lida."
  end

  def index
    @notifications = current_user.notifications.order(created_at: :desc).limit(5)
    render json: @notifications
  end

  private

  def set_notification
    @notification = current_user.notifications.find(params[:id])
  end
end
