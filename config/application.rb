require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module PlatformXternalApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths += %W(#{config.root}/lib)

    # Important to have because it's a security feature the prevents 'clickjacking' but Chrome doesn't seem to
    # respect Allow-from as a directive but because it's there it allows the iframe to load
    config.action_dispatch.default_headers['X-Frame-Options'] = "Allow-from dev.pos"

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.assets.initialize_on_precompile = false

    config.doorkeeper_application_id = '80cdbc7bcb59eb2ae0867b14779b379c11fa0aac1bb542decd39ef32976c4c37'
    config.doorkeeper_secret = '074905bd508cf4380fcc702e779189685da8d3869bc675b1ecd755762808b018'
    config.doorkeeper_application_url = 'http://patientos.aw.dev.pos:3000'
  end
end
