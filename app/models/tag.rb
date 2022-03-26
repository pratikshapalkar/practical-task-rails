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
class Tag < ApplicationRecord
  # polymorphic association 
  belongs_to :tagable, polymorphic: true
end
