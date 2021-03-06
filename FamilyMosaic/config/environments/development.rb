Rails.application.configure do
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
  # config.assets.js_compressor = :uglifier
  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  
  config.assets.digest = true
  config.static_cache_control = 'public, max-age=3600'
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }


  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      :address => "email-smtp.us-west-2.amazonaws.com",
      :port => 25, # Port 25 is throttled on AWS
      :user_name => "AKIAJMMJJCDPG7XMZLDA", # Your SMTP user here.
      :password => "ArUhrn88Q7m+NQcEFFM4EDSBSbI3Z8ZpUVz4HJe1Ykzf", # Your SMTP password here.
      :authentication => :login,
      :enable_starttls_auto => true
  }
  config.paperclip_defaults = {
    :path => ":rails_root/public/profile/:id/:filename",
    :url  => "/profile/:id/:filename"
  }
end