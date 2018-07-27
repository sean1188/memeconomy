class CommentsController < ApplicationController
	before_action :authenticate_user!, except:[:index]


	def comment_params
		params.require(:comment).permit(:body)
	end

	def index
		@post = Post.find(params[:comment][:post_id])
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
		@post = Post.find(params[:comment][:post_id])
		@comment = @post.comments.find(params[:comment][:comment_id])

		if (@comment.user_id == @current_user_id || current_user.role == 'moderator')
			if @comment.destroy
				flash[:success] = "Comment deleted!"
				redirect_to post_path(@post)
			end
		else
			
		end
	end
end