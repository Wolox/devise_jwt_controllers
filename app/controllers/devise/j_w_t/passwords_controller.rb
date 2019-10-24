module Devise
  module JWT
    class PasswordsController < Devise::PasswordsController
      respond_to :json

      def new
        respond_to_removed_action
      end
    end
  end
end
