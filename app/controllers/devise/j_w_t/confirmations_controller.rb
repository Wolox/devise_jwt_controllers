module Devise
  module JWT
    class ConfirmationsController < Devise::ConfirmationsController
      respond_to :json

      def new
        respond_to_removed_action
      end
    end
  end
end
