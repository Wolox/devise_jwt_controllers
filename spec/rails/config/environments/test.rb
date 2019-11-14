Rails.application.configure do
  config.eager_load = false
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.delivery_method = :test
  config.session_store :disabled
end
