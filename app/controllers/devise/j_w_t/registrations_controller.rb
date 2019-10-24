module Devise
  module JWT
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json

      def new
        render json: nil, status: :not_found
      end

      def edit
        render json: nil, status: :not_found
      end

      def cancel
        render json: nil, status: :not_found
      end
    end
  end
end
