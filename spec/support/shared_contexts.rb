shared_context 'with devise scope' do
  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end
end

shared_context 'with user logged in' do
  let(:current_user) { create(:user, confirmed_at: Time.zone.now) }
  before do
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, current_user)
    request.headers.merge!(auth_headers)
  end
end

