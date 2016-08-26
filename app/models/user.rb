class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  has_many :user_activities
  has_many :messages
  has_many :activities, through: :user_activities
  has_many :chatrooms, through: :messages
  validates :user_name, presence: true, uniqueness: true, on: :update

  #google rails validate on update only.
end
