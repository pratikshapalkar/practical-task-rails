class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # associations       
  has_many :players
  has_many :posts
  has_many :achievements
  has_many :post_attachments
  has_many :comments
  # allows to reference the user roles with strings, but store them in the database as integers.
  enum role: [:admin, :player]
  extend FriendlyId
  friendly_id :name, use: :slugged
  # after_initialize :set_default_role, :if=> :new_record?
  # def set_default_role
  #   self.role ||= :user
  # end
end
