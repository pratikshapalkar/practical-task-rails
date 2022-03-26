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
require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
