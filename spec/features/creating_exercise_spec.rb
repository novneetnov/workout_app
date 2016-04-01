require "rails_helper"

RSpec.feature "Creating Exercise" do

	before do
		@john = User.create!(email: "John@example.com", password: "password")
		login_as(@john)
	end

	scenario "with valid inputs" do
		visit "/"
		click_link "My Lounge"
		click_link "New Workout"
		expect(page).to have_link("Back")

		fill_in "Duration", with: 70
		fill_in "Workout Details", with: "Weight Lifting"
		fill_in "Activity Date", with: "2016-04-01"
		click_button "Create Exercise"

		expect(page).to have_content("Exercise has been created")

		exercise = Exercise.last
		expect(current_path).to eq(user_exercise_path(@john, exercise))
	end

end
