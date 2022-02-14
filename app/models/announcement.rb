class Announcement < ApplicationRecord
  # associations between announcement and sport
  belongs_to :sport
end
