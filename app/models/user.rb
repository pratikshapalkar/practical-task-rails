class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:admin, :player]
  has_one :player
  has_many :sports
  has_many :players, through: :sports
  # after_initialize :set_default_role, :if=> :new_record?
  # def set_default_role
  #   self.role ||= :user
  # end
end
