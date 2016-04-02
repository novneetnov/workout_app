class Exercise < ActiveRecord::Base
  belongs_to :user
	validates :user_id, presence: true
	validates :duration_in_min, presence: true, numericality: {only_integer: true}
	validates :workout, presence: true
	validates :workout_date, presence: true
	validate :workout_date_is_valid_date

	def workout_date_is_valid_date
		if not workout_date.is_a?(Date)
			errors.add(:workout_date, "Must be a valid date format")
		end
	end

	default_scope { where("workout_date > ?", 7.days.ago).order(workout_date: :desc) }
end
