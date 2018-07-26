class Frind < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :frind, class_name: "User", optional: true
	
	def self.search(search)
    where("title LIKE ?" , "%#{search}%") 
  end
end
