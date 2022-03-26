# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  role                   :integer          default("admin")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default(FALSE)
#  name                   :string
#  slug                   :string
#
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
