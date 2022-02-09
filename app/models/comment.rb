class Comment < ApplicationRecord
    belongs_to :post

    validates :comment_no, :user_comment, presence: true
end
