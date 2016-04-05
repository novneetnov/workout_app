require 'rails_helper'

RSpec.feature "Following Friends" do

	before do
		@john = User.create!(first_name: "John", last_name:"Doe", email: "john@exmaple.com", password: "password")
		@jen = User.create!(first_name: "Jen", last_name:"Doe", email: "jen@exmaple.com", password: "password")
		login_as(@john)
	end

	scenario "If signed in succeeds" do
		visit "/"
		expect(page).to have_content(@john.full_name)
		expect(page).to have_content(@jen.full_name)
		expect(page).not_to have_link("Follow", href: "/friendships?friend_id=#{@john.id}")

		link = "a[href = '/friendships?friend_id=#{@jen.id}']"
		find(link).click

		expect(page).not_to have_link("Follow", href: "/friendships?friend_id=#{@jen.id}")
	end

end
