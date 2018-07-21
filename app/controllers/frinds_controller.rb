class FrindsController < ApplicationController
	before_action :authenticate_user!

	def index
    @frinds = Frind.all
    if params[:search]
      @frinds = Frind.search(params[:search]).order("created_at DESC")
    else
      @frinds = Frind.all.order("created_at DESC")
    end
  end

	def create
		
	  @frind = current_user.frinds.build(friend_id: params[:friend_id])
	  @frind.accepted = false
	  if @frind.save
	    flash[:notice] = "Friend requested."
	    redirect_to "/frinds/whatever"
	  else
	    flash[:error] = "Unable to request frind."
	    redirect_to "/frinds/whatever"
	  end
	end

	def update

		@frind = Frind.find_by(id: params[:id])
		@frind.update(accepted: true)
    if @frind.save
	    redirect_to root_url, notice: "Successfully confirmed friend!"
	  else
	    redirect_to root_url, notice: "Sorry! Could not confirm friend!"
	  end
	end

	def destroy
		@frind = Frind.find_by(id: params[:id])
	  @frind.destroy
	  flash[:notice] = "Removed frind."
	  redirect_to "/frinds/whatever"
	end

  def whatever
    @users= User.all
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order("created_at DESC")
    end

  end
   
  

	def frind_params
	      params.require(:frinds).permit(:friend_id, :user_id, :accepted)
	end 
end