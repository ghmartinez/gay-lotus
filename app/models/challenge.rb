class Challenge < ApplicationRecord
  has_many :missions, dependent: :destroy
end
