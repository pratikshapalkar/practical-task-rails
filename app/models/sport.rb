# == Schema Information
#
# Table name: sports
#
#  id            :bigint           not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  no_of_players :integer
#
class Sport < ApplicationRecord
  # associations 
  has_many :players
  has_many :posts
  # belongs_to :user
  has_many :announcements
  # validations
  validates :name, :no_of_players, presence: true
end
