class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
          has_many :players
          has_many :posts
          has_many :achievements
   enum role: [:admin, :player]
  # has_many :player
  # has_many :sports
  # has_many :players, through: :sports
  extend FriendlyId
  friendly_id :name, use: :slugged
  # after_initialize :set_default_role, :if=> :new_record?
  # def set_default_role
  #   self.role ||= :user
  # end
end
