Agalma::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }



  config.action_mailer.smtp_settings = {
    address:                'smtp.gmail.com',
    port:                   '587',
    user_name:              'ilstucardo',
    password:               'ninjakick86',
    autentication:          'plain',
    enable_starttls_auto:   true,
  }

  #sass debugging

  # Expands the lines which load the assets
  # config.assets.debug = true // ya esta puesto mas arriba
  # Enable source maps in the browser
  config.sass.debug_info = true
  # source maps don't get output if this is true
  config.sass.line_comments = false
  # Do not compress assets
  config.assets.compress = false
  # config.assets.compile = true
  # config.serve_static_assets = false
  assets.paths << "#{Rails.root}/app/assets/fonts"
  # live-reload
  config.middleware.use Rack::LiveReload
end

silence_warnings do
  require 'pry'
  IRB = Pry
end

