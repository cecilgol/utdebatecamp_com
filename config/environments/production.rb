Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.log_level = :debug
  config.log_tags = [ :request_id ]
  config.action_mailer.default_url_options = { :host => 'tranquil-beyond-82540.herokuapp.com' }
  config.action_mailer.perform_caching = false
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'gmail.com',
    user_name:            ENV['GMAIL_USERNAME'],
    password:             ENV['GMAIL_PWD'],
    authentication:       :plain,
    enable_starttls_auto: true
  }
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.lograge.enabled = true
  config.lograge.custom_options = lambda do |event|
    {:time => event.time,
      :user => event.payload[:user]}
  end
  config.active_record.dump_schema_after_migration = false
end
