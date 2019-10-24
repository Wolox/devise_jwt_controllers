module ActionDispatch
  module Routing
    class Mapper
      def devise_jwt_for(*resources)
        options = resources.extract_options!
        new_options = default_devise_jwt_controllers.merge(options[:controllers] || {})
        devise_for(*resources, new_options)
      end

      private

      def default_devise_jwt_controllers
        {
          confirmations: 'devise/j_w_t/confirmations',
          passwords: 'devise/j_w_t/passwords',
          registrations: 'devise/j_w_t/registrations',
          sessions: 'devise/j_w_t/sessions',
          unlocks: 'devise/j_w_t/unlocks'
        }
      end
    end
  end
end