class AdminsBackofficeController < ApplicationController
  def authorize_admin
    redirect_to freights_path, alert: "Acesso negado" unless current_user&.admin?
  end
end
