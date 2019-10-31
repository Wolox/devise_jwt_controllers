class WardenConfig
  def add_mappings(model)
    Warden::JWTAuth.configure do |config|
      config.mappings = { model_sym(model) => model_class(model) }
      config.revocation_strategies = {
        model_sym(model) => model_class(model).jwt_revocation_strategy
      }
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
