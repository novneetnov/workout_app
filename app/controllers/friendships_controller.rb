class FriendshipsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		friend = User.find(params[:friend_id])
		if not current_user.follows_or_same?(friend)
			Friendship.create(friendship_params.merge!(user_id: current_user.id))
			redirect_to root_path
			flash[:success] = "You are now following #{friend.full_name}"
		end
	end

	def show
		@friend = User.find(params[:id])
		if current_user.friends.include?(@friend)
			@friend_exer = @friend.exercises.all
		else
			if current_user == @friend
				redirect_to user_exercises_path(current_user)
			else 
				redirect_to :back
				flash[:danger] = "You must follow #{@friend.full_name} before that action"
			end
		end
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
