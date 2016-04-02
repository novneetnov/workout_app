require "rails_helper"

RSpec.feature "Listing Exercises" do

	before do
		@john = User.create!(email: "john@example.com", password: "password")
		login_as(@john)
		@e1 = @john.exercises.create!(duration_in_min: 20, workout: "Body Building Routine", workout_date: "2016-04-01")
		@e2 = @john.exercises.create!(duration_in_min: 20, workout: "Cardio", workout_date: "2016-03-28")
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
	end

end
