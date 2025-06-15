class AdminsBackofficeController < ApplicationController
  layout "admin_dashboard"
  before_action :authenticate_admin!
  skip_before_action :authenticate_user!
end
