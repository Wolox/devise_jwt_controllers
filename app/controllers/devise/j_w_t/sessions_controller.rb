module Devise
  module JWT
    class SessionsController < Devise::SessionsController
      respond_to :json

      def new
        respond_to_removed_action
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
