Devise.setup do |config|
  require "devise/orm/active_record"

  config.omniauth :google_oauth2, ENV["GOOGLE_ID"], ENV["GOOGLE_SECRET"],
                  scope: "userinfo.email, userinfo.profile",
                  prompt: "select_account",
                  image_aspect_ratio: "square",
                  image_size: 50,
                  access_type: "offline"

  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [ :http_auth ]
  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other
end
