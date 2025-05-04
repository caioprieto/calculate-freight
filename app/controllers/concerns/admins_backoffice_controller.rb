class AdminsBackofficeController < ApplicationController
  layout "dashboard"

  def authorize_admin
    redirect_to root_path, alert: "Acesso negado" unless current_user&.admin?
  end
end
