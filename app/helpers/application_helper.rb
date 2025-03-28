module ApplicationHelper
  def state_image_url(state)
    state_code = state.to_s.downcase
    "/states/#{state_code}.png"
  end
end
