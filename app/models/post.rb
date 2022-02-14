class Post < ApplicationRecord
  has_many :comments
  # belongs_to :player
  belongs_to :sport
  has_many :tags, as: :tagable
  belongs_to :user
  has_many :post_attachments
  accepts_nested_attributes_for :post_attachments
  # validations
  validates :title, :description, presence: true
end
