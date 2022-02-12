class Achievement < ApplicationRecord
    # belongs_to :player
    belongs_to :user
    validates :award, :gold_medal, :silver_medal, :bronze_medal, presence: true
end
