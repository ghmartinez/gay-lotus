class Bungalow < ApplicationRecord
  has_many :users, dependent: :destroy
end
