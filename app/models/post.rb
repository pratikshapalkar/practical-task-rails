class Post < ApplicationRecord
  #associations one to many
  has_many :comments, dependent: :destroy
  belongs_to :sport
  # has_many :tags, as: :tagable
  belongs_to :user
  has_many :post_attachments, dependent: :destroy
  accepts_nested_attributes_for :post_attachments
  # validations
  validates :title, :description, presence: true
end
