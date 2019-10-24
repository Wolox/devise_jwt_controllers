describe Devise::JWT::RegistrationsController do
  include_context 'with devise scope'

  describe 'GET #new' do
    subject(:make_request) { get :new }

    include_examples 'devise removed action examples'
  end

  describe 'GET #cancel' do
    subject(:make_request) { get :cancel }

    include_examples 'devise removed action examples'
  end

  describe 'POST #create' do
    subject(:make_request) { post :create, params: params }

    let(:params) { { user: attributes_for(:user) } }

    context 'when valid parameters are used at registration' do
      it 'responds with created status' do
        make_request
        expect(response).to have_http_status(:created)
      end

      it 'creates a new user' do
        expect { make_request }.to change(User, :count).by(1)
      end
    end

    context 'when invalid parameters are used at registration' do
      let(:params) { {} }

      it 'responds with unprocessable entity status' do
        make_request
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create a new user' do
        expect { make_request }.not_to change(User, :count)
      end
    end
  end
end
