class Challenge < ApplicationRecord
  has_many :challenge_users, dependent: :destroy
  has_many :users, through: :challenge_users
end
