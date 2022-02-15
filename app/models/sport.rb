class Sport < ApplicationRecord
  # associations 
  has_many :players
  has_many :posts
  has_many :comments
  # belongs_to :user
  has_many :announcements
  # validations
  validates :sport_name, :no_of_players, presence: true
end
