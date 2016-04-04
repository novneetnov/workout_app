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

	def self.search_by_name(name)
		names_arr = name.split(" ")
		if names_arr.size == 1
			self.where("first_name LIKE :name1 or last_name LIKE :name2", 
								 name1: "%#{names_arr[0]}%", name2: "%#{names_arr[0]}%").order(:first_name)
		else
			self.where("first_name Like :name1 or first_name Like :name2 or last_nameLike :name1 or last_name Like :name2", name1: "%#{names_arr[0]}%", name2: "%#{names_arr[1]}%").order(:first_name)
		end
	end

end
