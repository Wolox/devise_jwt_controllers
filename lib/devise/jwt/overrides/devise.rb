Devise.setup do |config|
  config.parent_controller = 'Devise::JWT::BaseController'
  config.navigational_formats = %i[json]
end

module Devise
  module Models
    JWTAuthenticatable = Devise::Models::JwtAuthenticatable
  end
end
