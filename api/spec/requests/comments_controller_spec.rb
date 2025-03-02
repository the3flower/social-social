require 'rails_helper'

RSpec.describe CommentsController, type: :request do
  let(:user) { create(:user) }
  let(:post_record) { create(:post, user: user) }
  let(:comment) { create(:comment, user: user, post: post_record) }
  let(:valid_headers) { { "Authorization" => "Bearer #{encode_token(user_id: user.id)}" } }

  describe 'GET /posts/:post_id/comments' do
    before do
      create_list(:comment, 3, user: user, post: post_record)
    end

    it 'returns all comments for the specified post' do
      get "/posts/#{post_record.id}/comments"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end

    it 'returns 404 if post not found' do
      get "/posts/9999/comments"

      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to include('error' => 'Post not found')
    end
  end

  describe 'POST /posts/:post_id/comments' do
    let(:valid_attributes) { { comment: { content: 'New Comment' } } }
    let(:invalid_attributes) { { comment: { content: '' } } }

    context 'with valid parameters' do
      it 'creates a new comment' do
        expect {
          post "/posts/#{post_record.id}/comments", params: valid_attributes, headers: valid_headers
        }.to change(Comment, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['content']).to eq('New Comment')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a comment' do
        expect {
          post "/posts/#{post_record.id}/comments", params: invalid_attributes, headers: valid_headers
        }.not_to change(Comment, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to include('errors')
      end
    end

    it 'returns 404 if post not found' do
      post "/posts/9999/comments", params: valid_attributes, headers: valid_headers

      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to include('error' => 'Post not found')
    end
  end

  describe 'PATCH /comments/:id' do
    let(:valid_update_attributes) { { comment: { content: 'Updated Comment' } } }
    let(:invalid_update_attributes) { { comment: { content: '' } } }

    context 'with valid parameters' do
      it 'updates the specified comment' do
        patch "/comments/#{comment.id}", params: valid_update_attributes, headers: valid_headers

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['content']).to eq('Updated Comment')
      end
    end

    context 'with invalid parameters' do
      it 'does not update the comment' do
        patch "/comments/#{comment.id}", params: invalid_update_attributes, headers: valid_headers

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to include('errors')
      end
    end

    it 'returns 404 if comment not found' do
      patch '/comments/9999', params: valid_update_attributes, headers: valid_headers

      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to include('error' => 'Comment not found or not owned by user')
    end
  end

  describe 'DELETE /comments/:id' do
    it 'deletes the specified comment' do
      comment_to_delete = create(:comment, user: user, post: post_record)

      expect {
        delete "/comments/#{comment_to_delete.id}", headers: valid_headers
      }.to change(Comment, :count).by(-1)

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to include('message' => 'Comment deleted successfully')
    end

    it 'returns 404 if comment not found' do
      delete '/comments/9999', headers: valid_headers

      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to include('error' => 'Comment not found or not owned by user')
    end
  end
end
