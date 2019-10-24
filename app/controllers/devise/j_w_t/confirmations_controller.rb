module Devise
  module JWT
    class ConfirmationsController < Devise::ConfirmationsController
      respond_to :json

      def new
        render json: nil, status: :not_found
      end
    end
  end
end
