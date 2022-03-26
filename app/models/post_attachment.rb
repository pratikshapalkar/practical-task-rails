# == Schema Information
#
# Table name: post_attachments
#
#  id         :bigint           not null, primary key
#  avatar     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#
class PostAttachment < ApplicationRecord
  # associations 
  belongs_to :post
  belongs_to :user
  # image uploader
  mount_uploader :avatar, AvatarUploader
end
