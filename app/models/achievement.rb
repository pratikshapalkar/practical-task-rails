class Achievement < ApplicationRecord
    belongs_to :player
    
    validates :award, :gold_medal, :silver_medal, :bronze_medal, presence: true
end
