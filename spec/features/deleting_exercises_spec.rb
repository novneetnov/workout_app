require "rails_helper"

RSpec.feature "Deleting Exercise" do

	before do
		@owner = User.create!(first_name: "John", last_name:"Doe", email: "owner@example.com", password: "password")
		login_as(@owner)
		@owner_exer = @owner.exercises.create!(duration_in_min: 48, workout: "Cardio special", workout_date: Date.today)
	end

	scenario do
		visit "/"
		click_link "My Lounge"
		link = "//a[contains(@href, '/users/#{@owner.id}/exercises/#{@owner_exer.id}') and @data-method='delete']"
		find(:xpath, link).click
		#click_link "Delete"
		expect(page).to have_content("Exercise has been deleted")
	end
	
end
