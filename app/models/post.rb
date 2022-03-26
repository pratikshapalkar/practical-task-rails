# == Schema Information
#
# Table name: posts
#
#  id                 :bigint           not null, primary key
#  title              :string
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  post_attachment_id :integer
#  user_id            :integer
#  sport_id           :integer
#
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
