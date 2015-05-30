require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Prova
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    
    config.assets.initialize_on_precompile = false
    #config.active_record.raise_in_transactional_callbacks = true
    
    
    config.assets.paths << Rails.root.join("app","assets","images")

# PER CONFIGURARE GMAIL ACCOUNT
    #config.action_mailer.smtp_settings={
       #     address: "smtp.gmail.com",
       #     port: 587,
       #     domain: "mail.google.com",
       #     authentication: "plain",
       #     enable_starttls_auto: true,
       #     user_name: ENV['GMAIL_USERNAME'],
       #     password: ENV['GMAIL_PASSW']

        #}





    ActionMailer::Base.smtp_settings = {
    :port =>           '587',
    :address =>        'smtp.mandrillapp.com',
    #:user_name =>      Rails.application.secrets.MANDRILL_USERNAME,
    #:password =>       Rails.application.secrets.MANDRILL_APIKEY,
    :user_name =>       'tcorrado82@gmail.com',
    :password =>        'faFtH76P9Po5kouRlg_5YA',
    :authentication => :plain
}


 
   
  end
end
