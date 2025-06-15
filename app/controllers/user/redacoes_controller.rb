class User::RedacoesController < ApplicationController
  layout "user_dashboard"

  def index
    @user_words = current_user.user_words.limit(8)
  end

  def search
  end
end
