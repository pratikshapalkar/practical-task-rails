class Player < ApplicationRecord
    belongs_to :sport
    # belongs_to :user
    has_many :achievements
    has_many :posts
    mount_uploader :image, AvatarUploader
end
