require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsFullVersion
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Seoul'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
    # precompile vendor assets
    config.assets.precompile += %w( base.js )
    config.assets.precompile += %w( base.css )
    #controller css assets
    config.assets.precompile += [
                                 'dashboard.css',
                                ]
    #controller js assets
    config.assets.precompile += [
                                 'dashboard.js',
                                ]
    config.to_prepare do
        Devise::SessionsController.layout "pages"
        Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application"   : "pages" }
        Devise::ConfirmationsController.layout "pages"
        Devise::UnlocksController.layout "pages"
        Devise::PasswordsController.layout "pages"
    end
  end
end
