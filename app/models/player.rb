class Player < ApplicationRecord
    # belongs_to :sport
    # belongs_to :user
    # has_many :achievements
    # has_many :posts
    belongs_to :user
    mount_uploader :image, AvatarUploader

    validates :name, :email, :city, :state, :country, :gender, :image, presence: true
    #  validates :phone, numericality: { only_integer: true }
    validates :email, uniqueness: { scope: :email,
        message: "email should be unique" }
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    # validates_with NameValidator
    
end
