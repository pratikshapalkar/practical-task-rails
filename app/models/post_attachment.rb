class PostAttachment < ApplicationRecord
  # associations 
  belongs_to :post
  belongs_to :user
  # image uploader
  mount_uploader :avatar, AvatarUploader
end
