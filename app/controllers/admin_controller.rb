class AdminController < ApplicationController
	def index
		@users = User.where(["role = :role", {role: "user"}])
	end
end
