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
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
