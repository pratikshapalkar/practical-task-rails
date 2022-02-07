class Sport < ApplicationRecord
  # belongs_to :admin
  has_many :players
  # belongs_to :user
end
