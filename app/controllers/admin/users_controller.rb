class Admin::UsersController < AdminsBackofficeController
  def index
    @users = User.all
  end

  def toggle_active
    @user = User.find(params[:id])
    @user.update(active: !@user.active)

    redirect_to admin_users_path
  end
end
