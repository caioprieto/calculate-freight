class User::SettingsController < ApplicationController
  layout "user_dashboard"

  def index
    @user = current_user
  end
end
