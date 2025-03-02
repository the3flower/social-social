require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations' do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }

    it 'is valid with valid attributes' do
      comment = build(:comment, user: user, post: post)
      expect(comment).to be_valid
    end

    it 'is not valid without content' do
      comment = build(:comment, content: nil)
      expect(comment).not_to be_valid
      expect(comment.errors[:content]).to include("can't be blank")
    end

    it 'is not valid without a user' do
      comment = build(:comment, user: nil, post: post)
      expect(comment).not_to be_valid
      expect(comment.errors[:user]).to include("must exist")
    end

    it 'is not valid without a post' do
      comment = build(:comment, post: nil, user: user)
      expect(comment).not_to be_valid
      expect(comment.errors[:post]).to include("must exist")
    end
  end
end
