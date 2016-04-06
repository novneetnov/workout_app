class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"

	def self.get_friendship_id(current_user, friend)
		find_by(user_id: current_user.id, friend_id: friend.id).id
	end
end
