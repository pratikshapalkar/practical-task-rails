class Comment < ApplicationRecord
  # associations 
  belongs_to :post
  belongs_to :user
  #polymorphic association between tags and comments
  has_many :tags, as: :tagable
  # validations
  validates :comment_no, :user_comment, presence: true
end
