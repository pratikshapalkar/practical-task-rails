# == Schema Information
#
# Table name: sports
#
#  id            :bigint           not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  no_of_players :integer
#
require 'test_helper'

class SportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
