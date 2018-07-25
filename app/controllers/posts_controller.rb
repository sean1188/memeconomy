class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def update
    @post = Post.find(params[:id])
    @post.description = permit_post_update[:description]
    @post.category = permit_post_update[:category]
    if @post.save
      flash[:success] = "Post updated successfully!"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
  	@posts = Post.all
    @posts = @posts.order('created_at DESC')
  end

  def show
  	@post = Post.find(params[:id])
  end	

  def create
  	@post = Post.new(permit_post)
  	if @post.save
  		flash[:success] = "Success! New post created."
  		redirect_to post_path(@post)
  	else
  		flash[:error] = @post.errors.full_messages
  		redirect_to new_post_path
  	end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "Post successfully deleted."
      redirect_to posts_path
    else
      flash[:error] = @post.errors.full_messages
      redirect_to post_path(post)
    end
  end

  private
  	def permit_post
  		params.require(:post).permit(:image, :description, :category, :user_id)
  	end

  private
    def permit_post_update
      params.require(:post).permit(:description, :category)
    end
end