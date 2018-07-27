class UsersController < ApplicationController
	def index
		@users = user.all
	end
	def destroy
		@user = User.find_by(id: params[:id])
	  @user.destroy
	  flash[:notice] = "Removed frind."
	  redirect_to "/frinds/whatever"
	end
end
