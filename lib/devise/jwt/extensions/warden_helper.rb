module Devise
  module JWT
    module WardenHelper
      class << self
        def add_mappings(*models)
          Warden::JWTAuth.configure do |config|
            config.mappings = {}
            config.revocation_strategies ||= {}
            models.each do |model|
              map_model(model)
            end
            config.mappings = mappings
            config.revocation_strategies = revocations
          end
        end

        private

        def map_model(model)
          class_value = model_class(model)
          symbol = model_sym(model)
          mappings.merge!(symbol => class_value)
          revocations.merge!(symbol => model_class(model).jwt_revocation_strategy)
        end

        def mappings
          @mappings ||= {}
        end

        def revocations
          @revocations ||= {}
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
