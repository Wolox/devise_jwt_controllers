module Devise
  module JWT
    class BaseController < ApplicationController
      include ActionController::MimeResponds

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

      def respond_to_removed_action
        head :not_found
      end
    end
  end
end
