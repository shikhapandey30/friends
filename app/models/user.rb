class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :frinds
	has_many :received_frinds, class_name: "Frind", foreign_key: "friend_id"

	has_many :active_friends, -> { where(frinds: { accepted: true}) }, through: :frinds, source: :friend
	has_many :received_friends, -> { where(frinds: { accepted: true}) }, through: :received_frinds, source: :user
	has_many :pending_friends, -> { where(frinds: { accepted: false}) }, through: :frinds, source: :friend
	has_many :requested_frinds, -> { where(frinds: { accepted: false}) }, through: :received_frinds, source: :user

# to call all your friends
    

	def friends
	  active_friends | received_friends
	end

# to call your pending sent or received

	def pending
		pending_friends | requested_frinds
    end		
end
