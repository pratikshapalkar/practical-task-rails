# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  comment_no   :integer
#  user_comment :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  post_id      :integer
#  user_id      :integer
#  sport_id     :bigint
#
class Comment < ApplicationRecord
  # associations 
  belongs_to :post
  belongs_to :user
  #polymorphic association between tags and comments
  has_many :tags, as: :tagable
  # validations
  validates :comment_no, :user_comment, presence: true
end
