class AdminController < ApplicationController
	before_action :authenticate_user!
	def index
		@users = User.all
	end

	def show

	end

	def update  
		@user = User.find(params[:id])

	    @user.role = @user.role == 'moderator' ? 'user' : 'moderator'
	    if @user.save
	      flash[:success] = "Status updated successfully!"
	      redirect_to admin_index_path
	    else
	    	
	  	end
	end

	def select
	end
end
