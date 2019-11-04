module Devise
  module JWT
    module WardenHelper
      class << self
        def add_mappings(*models)
          Warden::JWTAuth.configure do |config|
            config.mappings ||= {}
            config.revocation_strategies ||= {}
            models.each do |model|
              config.mappings.merge!(model_sym(model) => model_class(model))
              config.revocation_strategies.merge!(
                model_sym(model) => model_class(model).jwt_revocation_strategy
              )
            end
          end
        end

        private

        def model_class(model)
          model.to_s.classify.constantize
        end

        def model_sym(model)
          model.to_s.singularize.to_sym
        end
      end
    end
  end
end
