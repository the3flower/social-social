class User < ApplicationRecord
    has_secure_password

    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :name, presence: true
    validates :password, presence: true, length: { minimum: 6 }

    def generate_token
        payload = { user_id: id, exp: 24.hours.from_now.to_i }
    end
end
