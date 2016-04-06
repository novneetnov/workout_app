require 'rails_helper'

RSpec.feature "Unfollowing Friend" do

	before do
		@john = User.create!(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
		@jen = User.create!(first_name: "Jen", last_name: "Doe", email: "jen@example.com", password: "password")
		login_as(@john)
		@following = Friendship.create!(user: @john, friend: @jen)
	end

	scenario do
		visit "/"
		click_link "My Lounge"
		link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
		find(link).click

		expect(page).to have_content(@jen.full_name + " unfollowed")
	end

end
