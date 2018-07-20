class Frind < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :frind, class_name: "User", optional: true 
	
end
