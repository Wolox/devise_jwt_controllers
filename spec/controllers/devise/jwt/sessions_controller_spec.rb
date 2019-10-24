describe Devise::JWT::SessionsController do
  include_context 'with devise scope'

  describe 'GET #new' do
    subject(:make_request) { get :new }

    include_examples 'devise removed action examples'
  end
end
