module Devise
  module JWT
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json

      def new
        respond_to_removed_action
      end

      def edit
        respond_to_removed_action
      end

      def cancel
        respond_to_removed_action
      end
    end
  end
end
