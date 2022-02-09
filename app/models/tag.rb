class Tag < ApplicationRecord
    belongs_to :player
    belongs_to :post

    validates :tag_title, :gold_medal, :silver_medal, :bronze_medal, presence: true
end
