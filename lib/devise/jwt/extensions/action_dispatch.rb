module ActionDispatch
  module Routing
    class Mapper
      def devise_jwt_for(*resources)
        options = resources.extract_options!
        new_options = default_devise_jwt_controllers.merge(options[:controllers] || {})
        devise_for(*resources, new_options)
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
