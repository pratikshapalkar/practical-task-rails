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
require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
