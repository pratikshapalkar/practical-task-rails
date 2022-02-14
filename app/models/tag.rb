class Tag < ApplicationRecord
  # polymorphic association 
  belongs_to :tagable, polymorphic: true
end
