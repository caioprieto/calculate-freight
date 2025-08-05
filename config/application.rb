require_relative "boot"

require "rails/all"

if Rails.env.development? || Rails.env.test?
  require "dotenv/rails-now"
end

Bundler.require(*Rails.groups)

module FreightCalculateApi
  class Application < Rails::Application
    config.load_defaults 8.0
    config.hosts.clear
    config.autoload_lib(ignore: %w[assets tasks])
    config.i18n.default_locale = :'pt-BR'

    config.middleware.use OmniAuth::Builder do
      provider :google_oauth2, ENV["GOOGLE_ID"], ENV["GOOGLE_SECRET"]
    end
  end
end
