require 'rails_helper'

RSpec.feature "Show Friend's workout" do

	before do
		@john = User.create!(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
		@joe = User.create!(first_name: "Joe", last_name: "Doe", email: "joe@example.com", password: "password")
		
		@e1 = @john.exercises.create!(duration_in_min: 74, workout: "Weight Lifting Routine", workout_date: Date.today)
		@e2 = @joe.exercises.create!(duration_in_min: 55, workout: "Sarah Weight Lifting Routine", workout_date: Date.today)
		login_as(@john)
		@following = Friendship.create!(user: @john, friend: @joe)
	end

	scenario "shows friend workout for last 7 days" do
		visit "/"
		click_link "My Lounge"
		click_link(@joe.full_name)

		expect(page).to have_content("#{@joe.full_name}'s Exercises")
		expect(page).to have_content(@e2.workout)
		expect(page).to have_css("div#chart")
		expect(page).to have_content("#{@joe.full_name}'s Friends")
	end

end
