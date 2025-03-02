class PostsController < ApplicationController
    before_action :authenticate_user!, only: [ :create, :update, :destroy ]

    # GET /posts
    def index
      posts = Post.includes(:user, :comments).all

      render json: posts.as_json(include: {
        user: { only: [ :id, :name ] },
        comments: {
          include: { user: { only: [ :id, :name ] } },
          only: [ :id, :content ]
        }
      }), status: :ok
    end

    # GET /posts/:id
    def show
      post = Post.includes(:user, :comments).find(params[:id])
      render json: post.as_json(include: {
        user: { only: [ :id, :name ] },
        comments: {
          include: { user: { only: [ :id, :name ] } }
        }
      }), status: :ok
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Post not found" }, status: :not_found
    end

    # POST /posts
    def create
      post = current_user.posts.new(post_params)

      if post.save
        render json: post.as_json(include: {
          user: { only: [ :id, :name ] },
          comments: { only: [ :id, :content ], include: { user: { only: [ :id, :name ] } } }
      }), status: :created
      else
        render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /posts/:id
    def update
      post = current_user.posts.find(params[:id])

      if post.update(post_params)
        render json: post, status: :ok
      else
        render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Post not found" }, status: :not_found
    end

    # DELETE /posts/:id
    def destroy
      post = current_user.posts.find(params[:id])
      post.destroy
      render json: { message: "Post deleted successfully" }, status: :ok
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Post not found" }, status: :not_found
    end

    private

    def post_params
      params.require(:post).permit(:content)
    end
end
