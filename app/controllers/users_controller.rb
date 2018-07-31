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
    #if current_user.id = @user.id
      render 'users/edit'
    #else
      #redirect_to @user
    
  end

	def update
    
 		@users = User.find_by(id: params[:id])
 		@users.update(email: params[:user][:email])
 		
 		redirect_to root_url, notice: "Successfully confirmed friend!"
	  # if @users.save
   #  redirect_to root_url, notice: "Successfully confirmed friend!"
	  # else
	  #   render 'frinds/whatever'
	  # end
	end
	 #  def update
  #   @users = user.update!
  #   @user = User.find_by(params[:id])
  #   if @user.update_attributes(params[:user])
  #     redirect_to users_path, :notice => "User updated."
  #   else
  #     redirect_to users_path, :alert => "Unable to update user."
  #   end
  # end
end