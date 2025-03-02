require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validations' do
    let(:user) { create(:user) }

    it 'is valid with valid attributes' do
      post = build(:post, user: user)
      expect(post).to be_valid
    end

    it 'is not valid without content' do
      post = build(:post, content: nil)
      expect(post).not_to be_valid
      expect(post.errors[:content]).to include("can't be blank")
    end

    it 'is not valid without a user' do
      post = build(:post, user: nil)
      expect(post).not_to be_valid
      expect(post.errors[:user]).to include("must exist")
    end
  end
end
