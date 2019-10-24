shared_context 'with devise scope' do
  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end
end

shared_context 'with user logged in' do
  let(:current_user) { create(:user, confirmed_at: Time.zone.now) }

  before do
    Devise::JWT::TestHelpers.auth_headers(request.headers, current_user)
  end
end
