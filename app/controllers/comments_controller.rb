class CommentsController < ApplicationController
	before_action :authenticate_user!, except:[:index]


	def comment_params
		params.require(:comment).permit(:body)
	end

	def index
	@comments = @post.comments.order(created_at: :desc)
	end

	def create
		@post = Post.find(params[:comment][:post_id])
		@comment = Comment.new
		@comment = @post.comments.new(comment_params)
		@comment.user = current_user

		if @comment.save
			flash[:success] = "Comment added!"
			redirect_to post_path(@post)
		end
	end

	def destroy
		@comment = @post.comments.find(params[:id])

		if @comment.user_id == @current_user_id 
			@comment.destroy
		else
			render json: {errors: { comment: ['not owned by user'] } }, status: :forbidden
		end
	end
end