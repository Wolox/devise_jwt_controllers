module Devise
  module JWT
    module WardenHelper
      class << self
        def add_mappings(*models)
          Warden::JWTAuth.configure do |config|
            config.mappings ||= {}
            config.revocation_strategies ||= {}
            models.each do |model|
              map_model(config, model)
            end
          end
        end

        private

        def map_model(config, model)
          class_value = model_class(model)
          symbol = model_sym(model)
          config.mappings.merge!(symbol => class_value, model => class_value)
          config.revocation_strategies.merge!(
            symbol => model_class(model).jwt_revocation_strategy,
            model => class_value
          )
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
end
