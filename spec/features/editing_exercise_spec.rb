require 'rails_helper'

RSpec.feature "Editing exercises" do

	before do
		@owner = User.create!(email: "owner@example.com", password: "password")
		login_as(@owner)
		@owner_exer = @owner.exercises.create!(duration_in_min: 45, workout: "Cardio Activity", workout_date: Date.today)
	end

	scenario "with valid input succeeds" do
		visit "/"
		click_link "My Lounge"
		link = "a[href='/users/#{@owner.id}/exercises/#{@owner_exer.id}/edit']"
		find(link).click
		fill_in "Duration", with: 50
		click_button "Update Exercise"
		
		expect(page.current_path).to eq(user_exercise_path(@owner, @owner_exer))
		expect(page).to have_content("Exercise has been updated")
		expect(page).to have_content(50)
		expect(page).not_to have_content(45)
	end

end
