class User < ApplicationRecord
    has_secure_password

    has_many :posts, dependent: :destroy
    has_many :comment, dependent: :destroy

    def generate_token
        payload = { user_id: id, exp: 24.hours.from_now.to_i }
        
    end
end
