require 'rails_helper'

RSpec.feature "Users sign in" do

	before do
		@john = User.create!(email: "john@example.com", password: "password")
		visit "/"
		click_link "Sign in"
	end
	
	scenario "with valid credentials" do	
		fill_in "Email", with: @john.email
		fill_in "Password", with: @john.password
		click_button "Log in"

		expect(page).to have_content("Signed in successfully")
		expect(page).to have_content("Signed in as #{@john.email}")
		expect(current_path).to eq(root_path)
	end

	scenario "with invalid credentials" do
		fill_in "Email", with: @john.email
		fill_in "Password", with: "dummy"
		click_button "Log in"
		
		expect(page).to have_content("Invalid email or password")
	end

end
