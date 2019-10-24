describe Devise::JWT::RegistrationsController do
  include_context 'with devise scope'

  describe 'GET #new' do
    subject(:make_request) { get :new }

    include_examples 'devise removed action examples'
  end

  describe 'GET #edit' do
    subject(:make_request) { get :new }

    include_examples 'devise removed action examples'
  end
end
