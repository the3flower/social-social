require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with a name, email, and password' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = build(:user, name: nil)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'is not valid without an email' do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is not valid with a duplicate email' do
      create(:user, email: 'bill@example.com')
      user = build(:user, email: 'bill@example.com')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("has already been taken")
    end
  end
end
