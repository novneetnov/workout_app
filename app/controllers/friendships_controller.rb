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
		@friend = User.find(params[:id])
		@friend_exer = @friend.exercises.all
	end

	def destroy
		@friendship = Friendship.find(params[:id])
		@friendship.destroy
		flash[:success] = "#{@friendship.friend.full_name} unfollowed"
		redirect_to user_exercises_path(current_user)
	end

	private
	def friendship_params
		params.permit(:friend_id)
	end

end
