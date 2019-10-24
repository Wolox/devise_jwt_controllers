Devise.setup do |config|
  config.secret_key = '57b5d0a02bc1e025c5077d9a62d329f66432ba975d3'

  config.mailer_sender = 'no-reply2@jwt.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 11

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  config.jwt do |jwt|
    jwt.secret = 'secret'
  end

  config.navigational_formats = []
end
