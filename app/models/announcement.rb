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
class Announcement < ApplicationRecord
  # associations between announcement and sport
  belongs_to :sport
end
