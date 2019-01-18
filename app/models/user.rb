class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  rolify
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  has_many :authentications

  has_many :frinds
	has_many :received_frinds, class_name: "Frind", foreign_key: "friend_id"

	has_many :active_friends, -> { where(frinds: { accepted: true}) }, through: :frinds, source: :user
	has_many :received_friends, -> { where(frinds: { accepted: true}) }, through: :received_frinds, source: :user
	has_many :pending_friends, -> { where(frinds: { accepted: false}) }, foreign_key: "friend_id", class_name: "Frind"
	has_many :requested_frinds, -> { where(frinds: { accepted: false}) }, through: :received_frinds, source: :user
   has_many  :all_except, ->(user) { where.not(id: user) && where.not(id: user.friends)}# to call all your friends
    

	def friends

    Frind.where("accepted = ? AND (user_id = ? OR friend_id = ?)", true, self.id, self.id)

    # Frind.where("accepted = ?", true)


	  # friends_ids = self.frinds.where(accepted: true).pluck(:friend_id)
   #  received_friends_ids = self.received_frinds.where(accepted: true).pluck(:friend_id)
   # # received_friends_ids = self.received_frinds.where(accepted: true).pluck(:user_id)

   #  friends_ids = friends_ids + received_friends_ids
   #  User.where(:id => friends_ids)
	end

# to call your pending sent or received

	def pending
		pending_friends | requested_frinds
  end

  def self.search(search)
    where("email LIKE ?" , "%#{search}%") 
  end
   

 	def friend_with?(other_user)
  	frinds.find_by(friend_id: other_user.id)
  end		
end
