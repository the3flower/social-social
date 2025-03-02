class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [ :create, :update, :destroy ]
    before_action :set_post, only: [ :create, :index ]
    before_action :set_comment, only: [ :update, :destroy ]

    # GET /posts/:post_id/comments
    def index
      comments = @post.comments.includes(:user)

      render json: comments.as_json(include: { user: { only: [ :id, :name ] } }), status: :ok
    end

    # POST /posts/:post_id/comments
    def create
      comment = @post.comments.new(comment_params.merge(user: current_user))

      if comment.save
        render json: comment.as_json(include: {
          user: { only: [ :id, :name ] }
        }), status: :created
      else
        render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /comments/:id
    def update
      if @comment.update(comment_params)
        render json: @comment, status: :ok
      else
        render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # DELETE /comments/:id
    def destroy
      @comment.destroy

      render json: { message: "Comment deleted successfully" }, status: :ok
    end

    private

    def set_post
      @post = Post.find(params[:post_id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Post not found" }, status: :not_found
    end

    def set_comment
      @comment = current_user.comments.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Comment not found or not owned by user" }, status: :not_found
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
