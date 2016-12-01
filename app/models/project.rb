class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :backers, through: :rewards
  accepts_nested_attributes_for :rewards
  validates_presence_of :title, :description, :goal, :start_date, :end_date

  after_create :default_reward

  # Automatically creates a default reward when new Projects are created
  def default_reward
    self.rewards.create(:description => "Thanks!", :dollar_amount => 1)
  end

end
