class Mission < ApplicationRecord
  belongs_to :challenge
  belongs_to :user, foreign_key: :player_user_id # no sé muy bien si estoy funcionará
end
