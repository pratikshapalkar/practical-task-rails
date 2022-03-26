# == Schema Information
#
# Table name: announcements
#
#  id         :bigint           not null, primary key
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sport_id   :integer
#
require 'test_helper'

class AnnouncementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
