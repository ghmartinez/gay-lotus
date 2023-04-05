class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :challenge_users, dependent: :destroy
  has_many :challenges, through: :challenge_users
  belongs_to :bungalow
end
