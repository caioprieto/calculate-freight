class User::DashboardController < ApplicationController
  layout "user_dashboard"

  def index
    @progress = 3
  end

  def search
    @query = params[:query]

    render json: "Deu certo!"
  end
end
