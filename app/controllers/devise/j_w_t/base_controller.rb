module Devise
  module JWT
    class BaseController < ApplicationController
      def respond_with(resource, _opts = {})
        render json: resource, status: resource.valid? ? :created : :unprocessable_entity
      end

      def respond_to_on_destroy
        head :no_content
      end
    end
  end
end
