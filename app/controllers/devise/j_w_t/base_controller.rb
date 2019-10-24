module Devise
  module JWT
    class BaseController < ApplicationController
      def respond_with(resource, _opts = {})
        if resource.valid?
          render json: resource, status: :created
        else
          render json: resource.errors, status: :unprocessable_entity
        end
      end

      def respond_to_on_destroy
        head :no_content
      end
    end
  end
end
