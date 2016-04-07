require 'rails_helper'

RSpec.feature "Show Friend's workout" do

	before do
		@john = User.create!(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
		@joe = User.create!(first_name: "Joe", last_name: "Doe", email: "joe@example.com", password: "password")
		@jen = User.create!(first_name: "Jen", last_name: "Doe", email: "jen@example.com", password: "password")
		
		@e1 = @john.exercises.create!(duration_in_min: 74, workout: "Weight Lifting Routine", workout_date: Date.today)
		@e2 = @joe.exercises.create!(duration_in_min: 55, workout: "Sarah Weight Lifting Routine", workout_date: Date.today)
		login_as(@john)
		@following1 = Friendship.create!(user: @john, friend: @joe)
		@following2 = Friendship.create!(user: @joe, friend: @jen)
		
		visit "/"
		click_link "My Lounge"
		click_link(@joe.full_name)
end

	scenario "for last 7 days" do
		expect(page).to have_content("#{@joe.full_name}'s Exercises")
		expect(page).to have_content(@e2.workout)
		expect(page).to have_css("div#chart")
		click_link "Show"
		expect(current_path).to eq(user_exercise_path(@joe, @e2))
		click_link "Back"
	end

	scenario "and his/her Friends" do
		expect(page).to have_content("#{@joe.full_name}'s Friends")
		expect(page).to have_link(@jen.full_name)
		expect(page).to have_link("Follow")	
		click_link @jen.full_name
		expect(page).to have_content "You must follow #{@jen.full_name} before that action"
		
		click_link("Follow")
		expect(page).to have_content("You are now following #{@jen.full_name}")
	end

end
