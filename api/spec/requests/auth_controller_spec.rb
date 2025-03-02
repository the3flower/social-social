require 'rails_helper'

RSpec.describe AuthController, type: :request do
  let(:user) { create(:user) }
  let(:valid_headers) { { "Authorization" => "Bearer #{encode_token(user_id: user.id)}" } }

  describe 'POST /auth/register' do
    let(:valid_attributes) do
      { name: "New User", email: "new.user@example.com", password: "password" }
    end

    let(:invalid_attributes) do
      { name: "", email: "invalidemail", password: "" }
    end

    context 'with valid parameters' do
      it 'creates a new user and returns success message' do
        expect {
          post '/auth/register', params: valid_attributes
        }.to change(User, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to include("message" => "User registered successfully")
      end
    end

    context 'with invalid parameters' do
      it 'does not create a user and returns errors' do
        expect {
          post '/auth/register', params: invalid_attributes
        }.not_to change(User, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to include("errors")
      end
    end
  end

  describe 'POST /auth/login' do
    context 'with valid credentials' do
      it 'returns a success message and a token' do
        post '/auth/login', params: { email: user.email, password: 'password@1234' }

        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)
        expect(json_response).to include("message" => "Login successful")
        expect(json_response).to have_key("token")
      end
    end

    context 'with invalid credentials' do
      it 'returns an unauthorized error' do
        post '/auth/login', params: { email: user.email, password: 'wrongpassword' }

        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)).to include("error" => "Invalid email or password")
      end
    end
  end

  describe 'POST /auth/logout' do
    it 'returns a success message' do
      post '/auth/logout', headers: valid_headers

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to include("message" => "Logout successful")
    end
  end
end
