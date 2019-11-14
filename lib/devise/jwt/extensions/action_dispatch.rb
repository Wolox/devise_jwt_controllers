module ActionDispatch
  module Routing
    class Mapper
      def devise_jwt_for(*resources)
        options = resources.extract_options!
        options[:controllers] = default_devise_jwt_controllers.merge(options[:controllers] || {})
        options[:defaults] = { format: :json }.merge(options[:defaults] || {})
        Devise::JWT::WardenHelper.add_mappings(*resources)
        devise_for(*resources, options)
      end

      private

      def default_devise_jwt_controllers
        {
          confirmations: 'devise/jwt/confirmations',
          passwords: 'devise/jwt/passwords',
          registrations: 'devise/jwt/registrations',
          sessions: 'devise/jwt/sessions',
          unlocks: 'devise/jwt/unlocks'
        }
      end
    end
  end
end
