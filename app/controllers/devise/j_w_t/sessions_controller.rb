module Devise
  module JWT
    class SessionsController < Devise::SessionsController
      respond_to :json

      def new
        render json: nil, status: :not_found
      end

      def create
        super do
          token = "Bearer #{request.env['warden-jwt_auth.token']}"
          response.set_header('Authorization', token)
        end
      end
    end
  end
end
