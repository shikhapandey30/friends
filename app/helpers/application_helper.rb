module ApplicationHelper
	def count_like(comment)
    comment.likes.where(like: true).count
  end
    
  def count_dislike(comment)
    comment.likes.where(like: false).count
  end
end
