class Frind < ApplicationRecord
	belongs_to :user
	belongs_to :friend, class_name: "User"
end
