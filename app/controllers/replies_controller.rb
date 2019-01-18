class RepliesController < ApplicationController
	before_action do
		@comment = Comment.find(params[:comment_id])
		@post = Post.find(params[:post_id])
	end

	def index
		@replies = @comment.replies
		@reply = @comment.replies.new	
	end

	def new
		@reply = @comment.replies.new
	end


	def create
    @reply = Reply.new(:body=>params[:reply][:body],:comment_id=>params[:reply][:comment_id])
    if @reply.save
	    flash[:notice]="replies created"
	    respond_to do |format|
	    	format.html
	   		format.js { render action: "create", :locals => {comment_id: params[:reply][:comment_id]} }
	 	  end
 		end
  end

  def show
  end
end