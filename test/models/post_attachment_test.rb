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
require 'test_helper'

class PostAttachmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
