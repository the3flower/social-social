require 'rails_helper'

RSpec.describe PostsController, type: :request do
  let(:user) { create(:user) }
  let(:post_record) { create(:post, user: user) }
  let(:valid_headers) { { "Authorization" => "Bearer #{encode_token(user_id: user.id)}" } }

  describe 'GET /posts' do
    before do
      create_list(:post, 3, user: user)
    end

    it 'returns all posts' do
      get '/posts'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe 'GET /posts/:id' do
    it 'returns the specified post' do
      get "/posts/#{post_record.id}"

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['content']).to eq(post_record.content)
      expect(json_response['user']['id']).to eq(user.id)
    end

    it 'returns 404 if post not found' do
      get "/posts/9999"

      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to include('error' => 'Post not found')
    end
  end

  describe 'POST /posts' do
    let(:valid_attributes) { { post: { content: 'New Post' } } }
    let(:invalid_attributes) { { post: { content: '' } } }

    context 'with valid parameters' do
      it 'creates a new post' do
        expect {
          post '/posts', params: valid_attributes, headers: valid_headers
        }.to change(Post, :count).by(1)

        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a post' do
        expect {
          post '/posts', params: invalid_attributes, headers: valid_headers
        }.not_to change(Post, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to include('errors')
      end
    end
  end

  describe 'PATCH /posts/:id' do
    let(:valid_update_attributes) { { post: { content: 'Updated Content' } } }
    let(:invalid_update_attributes) { { post: { content: '' } } }

    context 'with valid parameters' do
      it 'updates the specified post' do
        patch "/posts/#{post_record.id}", params: valid_update_attributes, headers: valid_headers

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['content']).to eq('Updated Content')
      end
    end

    context 'with invalid parameters' do
      it 'does not update the post' do
        patch "/posts/#{post_record.id}", params: invalid_update_attributes, headers: valid_headers

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to include('errors')
      end
    end

    it 'returns 404 if post not found' do
      patch '/posts/9999', params: valid_update_attributes, headers: valid_headers

      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to include('error' => 'Post not found')
    end
  end

  describe 'DELETE /posts/:id' do
    it 'deletes the specified post' do
      post_to_delete = create(:post, user: user)

      expect {
        delete "/posts/#{post_to_delete.id}", headers: valid_headers
      }.to change(Post, :count).by(-1)

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to include('message' => 'Post deleted successfully')
    end

    it 'returns 404 if post not found' do
      delete '/posts/9999', headers: valid_headers

      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to include('error' => 'Post not found')
    end
  end
end
