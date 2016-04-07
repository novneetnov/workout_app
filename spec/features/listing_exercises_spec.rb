require "rails_helper"

RSpec.feature "Listing Exercises" do

	before do
		@john = User.create!(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
		@sarah = User.create!(first_name: "Sarah", last_name: "Doe", email: "sarah@example.com", password: "password")
		login_as(@john)
		@e1 = @john.exercises.create!(duration_in_min: 20, workout: "Body Building Routine", workout_date: Date.today)
		@e2 = @john.exercises.create!(duration_in_min: 20, workout: "Cardio", workout_date: 1.day.ago)
		@following = Friendship.create!(user: @john, friend: @sarah)
	end

	scenario "shows user's workout for last 7 days" do
		visit "/"
		click_link "My Lounge"

		expect(page).to have_content(@e1.duration_in_min)
		expect(page).to have_content(@e1.workout)
		expect(page).to have_content(@e1.workout_date)
		expect(page).to have_content(@e2.duration_in_min)
		expect(page).to have_content(@e2.workout)
		expect(page).to have_content(@e2.workout_date)

		expect(page).to have_link("Show")
		expect(page).to have_link("Edit")
		expect(page).to have_link("Delete")
		click_link("Show", href: user_exercise_path(@john, @e1))
		expect(current_path).to eq(user_exercise_path(@john, @e1))

	end

	scenario "Shows a list of current_user's friends" do
		visit "/"
		click_link "My Lounge"

		expect(page).to have_content("My Friends")
		expect(page).to have_link(@sarah.full_name)
		expect(page).to have_link("Unfollow")
	end

end
