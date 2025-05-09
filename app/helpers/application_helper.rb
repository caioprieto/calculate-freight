module ApplicationHelper
  require "image_processing/mini_magick"

  def state_image_url(state)
    state_code = state.to_s.downcase
    "/states/#{state_code}.png"
  end

  def user_search_path
    return user_dashboard_search_path if current_page?("/user/dashboard") || current_page?("/user/settings")

    user_redacoes_search_path if current_page?("/user/redacoes")
  end
end
