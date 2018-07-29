class LikesController < ApplicationController
  # def new
  # end

  # def show
  # end

  # def update
  # end

  # def destroy
  # end

  def upvote 
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_to posts_path
  end  

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_to posts_path
  end
end