# == Schema Information
#
# Table name: achievements
#
#  id           :bigint           not null, primary key
#  award        :string
#  gold_medal   :integer
#  silver_medal :integer
#  bronze_medal :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  status       :string
#  user_id      :integer
#
require 'test_helper'

class AchievementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
