class Sport < ApplicationRecord
  # belongs_to :admin
  # has_many :players
  # has_many :posts
  # belongs_to :user
  # has_many :announcements
  validates :sport_name, :no_of_players, presence: true
  
end
