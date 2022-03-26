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
class Achievement < ApplicationRecord
  # belongs_to :player
  # association --achievement belongs to particular user 
  belongs_to :user
  # validations
  validates :award, :gold_medal, :silver_medal, :bronze_medal, presence: true
end
   
