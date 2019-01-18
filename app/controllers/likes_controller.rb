class LikesController < ApplicationController
	before_action :set_comment
	def create
	 Like.create_like(@comment, current_user)
	end

	def dislike
	 Like.create_dislike(@comment, current_user)
	end

	def set_comment
	 @comment=User.find_comment(params[:id], params[:type])
	end
end
