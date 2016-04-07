# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Exercise.destroy_all
Friendship.destroy_all

User.create! [
	{"first_name": "Sanjay", "last_name": "Bakshi", "email": "sanjay@example.com", "password": "password"},
	{"first_name": "Warren", "last_name": "Buffett", "email": "warren@example.com", "password": "password"},
	{"first_name": "Charlie", "last_name": "Munger", "email": "charlie@example.com", "password": "password"},
	{"first_name": "Jaggi", "last_name": "Vasudev", "email": "jaggi@example.com", "password": "password"},
	{"first_name": "Seth", "last_name": "Godin", "email": "seth@example.com", "password": "password"},
	{"first_name": "Anshul", "last_name": "Khare", "email": "anshul@example.com", "password": "password"},
	{"first_name": "Mahi", "last_name": "Dhoni", "email": "mahi@example.com", "password": "password"},
	{"first_name": "Don", "last_name": "Knuth", "email": "don@example.com", "password": "password"},
	{"first_name": "Arpit", "last_name": "Ranka", "email": "arpit@example.com", "password": "password"},
	{"first_name": "David", "last_name": "Hansson", "email": "david@example.com", "password": "password"},
	{"first_name": "Andrew", "last_name": "NG", "email": "andrew@example.com", "password": "password"},
	{"first_name": "Charles", "last_name": "Darwin", "email": "charles@example.com", "password": "password"},
	{"first_name": "Albert", "last_name": "Einstein", "email": "albert@example.com", "password": "password"},
	{"first_name": "Vishal", "last_name": "Khandelwal", "email": "vishal@example.com", "password": "password"}
]

data_hash = {
	duration_in_min: [35, 45, 60, 40, 50, 45, 55],
	workout: [ 
		"3 Rounds: 30 Crunches, 10 Rounds: Pushups",
		"3 sets of Biceps, 5 rounds of triceps",
		"Full Body Workout, focus on abdomen and lower belly, bridge workout",
		"Batman Punches and clever fighting techniques to take 20 guys at a time",
		"Yoga, Kriya Yoga, Asanas, Hatha yoga, Deadly Twisting Asanas",
		"Shadow Boxing, Jabs, Punches, Upper Cut. Lower Punches, Leg Kicks",
		"Weight Lifting Techniques, Leg Squats, 2 Rounds: Pushups on one hand"
	],
	workout_date: [Date.today, 1.day.ago, 2.days.ago, 3.days.ago, 4.days.ago, 5.days.ago, 6.days.ago]
}

User.all.each do |user|
	#user.exercises.create!(data_arr[1])
	Array(0..6).sample(7).each do |idx|
		duration_in_min = data_hash[:duration_in_min].sample
		workout = data_hash[:workout].sample
		workout_date = data_hash[:workout_date][idx]
		user.exercises.create!(duration_in_min: duration_in_min, workout: workout, workout_date: workout_date)
	end
end

all_users = User.all
User.all.each do |user|
	friend1, friend2, friend3 = all_users.reject {|u| u == user}.sample(3)
	Friendship.create(user_id: user.id, friend_id: friend1.id)
	Friendship.create(user_id: user.id, friend_id: friend2.id)
	Friendship.create(user_id: user.id, friend_id: friend3.id)
end
