class FavoritosController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.favoritos.find_or_create_by!(tema_id: params[:tema_id])
    redirect_back fallback_location: root_path
  end

  def destroy
    favorito = current_user.favoritos.find_by!(tema_id: params[:tema_id])
    favorito.destroy
    redirect_back fallback_location: root_path
  end
end
