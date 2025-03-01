class AuthController < ApplicationController
    include AuthHelpers

    # POST /auth/register
    def register
        user = User.new(user_params)

        if user.save
            render json: { message: 'User registered successfully' }, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # POST /auth/login
    def login
        user = User.find_by(email: params[:email])

        if user&.authenticate(params[:password])
            token = encode_token({ user_id: user.id })
            
            render json: { message: 'Login successful', token: token }, status: :ok
        else
            render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
    end

    private

    def user_params
        params.permit(:name, :email, :password)
    end
end
