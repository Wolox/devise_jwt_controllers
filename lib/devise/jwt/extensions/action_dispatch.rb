module ActionDispatch
  module Routing
    class Mapper
      def devise_jwt_for(*resources)
        options = resources.extract_options!
        options[:controllers] = default_devise_jwt_controllers.merge(options[:controllers] || {})
        options[:defaults] = { format: :json }.merge(options[:defaults] || {})
        add_mappings(*resources)
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

      def add_mappings(model)
        Warden::JWTAuth.configure do |config|

          config.mappings = { model_sym(model) => model_class(model) }
          config.revocation_strategies = {
            model_sym(model) => model_class(model).jwt_revocation_strategy
          }
        end
      end

      def model_class(model)
        model.to_s.classify.constantize
      end

      def model_sym(model)
        model.to_s.singularize.to_sym
      end
    end
  end
end
