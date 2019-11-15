Devise.setup do |config|
  config.parent_controller = 'Devise::JWT::BaseController'
end

module Devise
  module Models
    JWTAuthenticatable = Devise::Models::JwtAuthenticatable
  end
end
