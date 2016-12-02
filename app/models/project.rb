class Project < ActiveRecord::Base
	belongs_to :user
	has_many :rewards
	has_many :pledges, through: :rewards
	has_many :backers, through: :rewards
	accepts_nested_attributes_for :rewards
	validates_presence_of :title, :description, :goal, :start_date, :end_date
	validates_date :start_date, :on_or_after => lambda { Date.current }
	validates_date :end_date, :on_or_after => :start_date

	after_create :default_reward

	# Automatically creates a default reward when new Projects are created
	def default_reward
		self.rewards.create(:description => "Thanks!", :dollar_amount => 1)
	end

def backed_by?(pledger)
	pledges.each do |backed|
		# counter = 0
		if backed.user == pledger
			true
			# counter += 1
	# 	else
			# false
		# break if counter > 0
		end
	end
end
end
