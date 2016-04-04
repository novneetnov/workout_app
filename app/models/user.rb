class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :exercises
	validates :last_name, presence: true
	self.per_page = 4

	def full_name
		"#{first_name if !first_name.nil?} #{last_name}".strip
	end
end
