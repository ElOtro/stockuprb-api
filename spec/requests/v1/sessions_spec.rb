require 'rails_helper'

RSpec.describe '/v1/auth', type: :request do
  let(:user) { create_user }
  let(:login_url) { '/v1/auth' }
  let(:logout_url) { '/v1/auth' }

  context 'logging in' do
    before do
      login_with_api(user)
      get "/v1/users/#{user.id}", headers: {
        'Authorization': response.headers['Authorization']
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end

  context 'password is missing' do
    before do
      post login_url, params: {
        email: user.email,
        password: nil
      }
    end

    it 'returns 401' do
      expect(response.status).to eq(401)
    end
  end

  context 'logging out' do
    it 'returns 204' do
      delete logout_url

      expect(response).to have_http_status(204)
    end
  end
end
