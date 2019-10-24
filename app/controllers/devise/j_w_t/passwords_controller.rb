module Devise
  module JWT
    class PasswordsController < Devise::PasswordsController
      respond_to :json

      def new
        render json: nil, status: :not_found
      end
    end
  end
end
