class Comment < ApplicationRecord
    belongs_to :post

    has_many :tags, as: :tagable
    validates :comment_no, :user_comment, presence: true
end
