class Admin::DashboardController < AdminsBackofficeController
  before_action :authorize_admin
end
