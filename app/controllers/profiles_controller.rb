class ProfilesController < ApplicationController
	def index
		
	end

	def edit
		@post = Post.find(params[:id])
      	
	end

	def show
		@user = User.find(params[:id])
	end

	def update
		@user = current_user
    	if @user.update_attributes(user_params)
      		flash[:success] = "Post updated successfully!"
      		redirect_to profiles_path(current_user.id)
      	else
      		flash[:error] = @post.errors.full_messages
      		render 'edit'
      	end
	end
	
	private
		def user_params
      		params.require(:user).permit(:about)
  	end
end
