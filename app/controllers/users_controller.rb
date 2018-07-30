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

	def show
	end

  def edit
  	@user = User.find_by(id: params[:id])
  	#redirect_to "/layouts/application"
  end

	def update
 		@user = User.find_by(id: params[:id])
		@user.update(accepted: true)
    if @user.update(user_params)
	    redirect_to root_url, notice: "Successfully confirmed friend!"
	  else
	    render 'frinds/whatever'
	  end
	end
	
end