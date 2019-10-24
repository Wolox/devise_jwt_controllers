module Devise
  module JWT
    class UnlocksController < Devise::UnlocksController
      respond_to :json

      def new
        respond_to_removed_action
      end
    end
  end
end
