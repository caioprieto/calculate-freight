class AdminsBackofficeController < ApplicationController
  def authorize_admin!
    debugger
    # redirect_to root_path, alert: "Acesso negado" unless current_user&.admin?
  end
end
