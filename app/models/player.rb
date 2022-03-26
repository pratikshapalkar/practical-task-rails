# == Schema Information
#
# Table name: players
#
#  id         :bigint           not null, primary key
#  city       :string
#  state      :string
#  country    :string
#  phone      :bigint
#  gender     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sport_id   :integer
#  name       :string
#  image      :string
#  email      :string
#  user_id    :integer
#
class Player < ApplicationRecord
  # associations
  belongs_to :sport
  belongs_to :user
  # image uploader 
  mount_uploader :image, AvatarUploader
  # validations
  # validates :name, :email, :city, :state, :country, :gender, :image, presence: true
  # validates :phone, numericality: { only_integer: true }
  validates :email, uniqueness: { scope: :email,message: "email should be unique" }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  # acts as tagable
  acts_as_taggable_on :tags
  # acts_as_taggable_on :skills, :interests #You can also configure multiple tag types per model
end
