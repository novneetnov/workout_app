class DashboardController < ApplicationController
  
	def index
		@athletes = User.paginate(page: params[:page])
	end

	def search
		if not params[:search_name].empty?
			@athletes = User.search_by_name(params[:search_name]).paginate(page: params[:page], per_page: 5)
		else
			redirect_to root_path
			flash[:danger] = "Please enter a valid search term"
		end
	end

end
