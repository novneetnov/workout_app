class FriendshipsController < ApplicationController
	before_action :authenticate_user!

	def create
		friend = User.find(params[:friend_id])
		if not current_user.follows_or_same?(friend)
			Friendship.create(friendship_params.merge!(user_id: current_user.id))
			redirect_to root_path
		end
	end

	def show

	end

	def destroy

	end

	private
	def friendship_params
		params.permit(:friend_id)
	end

end
