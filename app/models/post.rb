class Post < ApplicationRecord
    has_many :comments
    belongs_to :player
    belongs_to :sport
    has_many :tags
    has_many :players, through: :tags
    mount_uploader :images, AvatarUploader

    validates :title, :images, :description, presence: true
end
