class FrindsController < ApplicationController

	

  def create
	  @frind = current_user.frinds.build(friend_id: params[:friend_id])
	  if @frind.save
	    flash[:notice] = "Friend requested."
	    redirect_to "/frinds/whatever"
	  else
	    flash[:error] = "Unable to request frind."
	    redirect_to :back
	  end
	end

	def update
		@frind = frind.find_by(id: params[:id])
		@frind.update(status: "accepted")
	  if @frind.save
	    redirect_to root_url, notice: "Successfully confirmed friend!"
	  else
	    redirect_to root_url, notice: "Sorry! Could not confirm friend!"
	  end
	end

	def destroy
	  @frind = frind.find_by(id: params[:id])
	  @frind.destroy
	  flash[:notice] = "Removed frind."
	  redirect_to :back
	end

  def whatever
  	@users= User.all
  end    


end
