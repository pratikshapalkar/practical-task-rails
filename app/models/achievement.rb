class Achievement < ApplicationRecord
  # belongs_to :player
  # association --achievement belongs to particular user 
  belongs_to :user
  # validations
  validates :award, :gold_medal, :silver_medal, :bronze_medal, presence: true
end
   