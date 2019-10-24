shared_context 'with devise scope' do
  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end
end
