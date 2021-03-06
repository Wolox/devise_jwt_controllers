shared_examples 'devise removed action examples' do
  before do
    make_request
  end

  it 'responds with not found status' do
    expect(response).to have_http_status(:not_found)
  end
end

shared_examples 'unauthorized user examples' do
  before do
    make_request
  end

  it 'responds with unauthorized status' do
    expect(response).to have_http_status(:unauthorized)
  end
end
