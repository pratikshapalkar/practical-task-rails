# == Schema Information
#
# Table name: tags
#
#  id             :integer          not null, primary key
#  name           :string
#  created_at     :datetime
#  updated_at     :datetime
#  taggings_count :integer          default(0)
#
require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
