describe Devise::JWT::SessionsController do
  include_context 'with devise scope'

  describe 'GET #new' do
    subject(:make_request) { get :new }

    include_examples 'devise removed action examples'
  end

  describe 'POST #create' do
    subject(:make_request) { post :create, params: params }

    let(:user) { create(:user, confirmed_at: Time.zone.now) }
    let(:params) do
      { user: { email: user.email, password: user.password } }
    end

    context 'when a confirmed user attemps to sign in' do
      before do
        make_request
      end

      it 'returns created as http status' do
        expect(response).to have_http_status(:created)
      end

      it 'returns the JTW token in authorization header' do
        expect(response.headers['Authorization']).to be_present
      end
    end

    context 'when login params are incorrect' do
      let(:params) { {} }

      before do
        make_request
      end

      it 'returns unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
