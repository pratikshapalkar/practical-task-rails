class Sport < ApplicationRecord
  # belongs_to :admin
  has_many :players
  has_many :posts
  # belongs_to :user
end
