class ExercisesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_exercise, except: [:index, :new, :create]

	def index
		@exercises = current_user.exercises.all
	end

	def new
		@exercise = current_user.exercises.new
	end

	def create
		@exercise = current_user.exercises.build(exercise_params)	
		respond_to do |format|
			if @exercise.save
				format.html {redirect_to [current_user, @exercise], flash: { success: "Exercise has been created" } }
			else
				format.html {render :new}
				flash[:danger] = "Exercise has not been created"
			end
		end
	end

	def edit
	end

	def update
		respond_to do |format|
			if @exercise.update(exercise_params)
				format.html {redirect_to [current_user, @exercise], flash: {success: "Exercise has been updated"}}
			else
				format.html {render :edit, flash: {danger: "Exercise has not been updated"}}
			end
		end
	end

	def show
	end

	def destroy
		@exercise.destroy
		flash[:success] = "Exercise has been deleted"
		redirect_to user_exercises_path(current_user)
	end

	private
	def exercise_params
		params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
	end

	def set_exercise
		@exercise = current_user.exercises.find(params[:id])
	end
end
