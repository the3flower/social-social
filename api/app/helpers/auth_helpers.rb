module AuthHelpers
    SECRET_KEY = ENV['JWT_SECRET'] || 'fallback_secret_key'

    def encode_token(payload)
        # JWT.encode(payload, secret_key, algorithm)
        JWT.encode(payload, SECRET_KEY, 'HS256')
    end

    def decode_token()
        begin
            # JWT.decode(token, secret_key, options)
            decoded = JWT.decode(token, SECRET_KEY, 'HS256')
            decoded[0]
        rescue JWT::DecodeError
            nil
        end
    end

    def current_user()
        token = headers['Authorization']&.split(' ')&.last
        return nil unless token
      
        decoded = decode_token(token)
        return nil unless decoded && decoded['user_id']
      
        User.find_by(id: decoded['user_id'])
    end

    def authenticate!
        error!({ error: 'Unauthorized' }, 401) unless current_user
    end
end