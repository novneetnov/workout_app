require 'rails_helper'

RSpec.feature "Users signup" do

	scenario "with valid credentials" do
		visit "/"
		click_link "Sign up"	
		fill_in "First name", with: "John"
		fill_in "Last name", with: "Doe"
		fill_in "Email", with: "johndoe@example.com"
		fill_in "Password", with: "password"
		fill_in "Password confirmation", with: "password"
		click_button "Sign up"

		expect(page).to have_content("You have signed up successfully")
		expect(page).to have_content("John Doe")
		expect(current_path).to eq(root_path)
	end

end
