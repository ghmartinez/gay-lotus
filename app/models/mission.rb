class Mission < ApplicationRecord
  belongs_to :challenge
  belongs_to :player_user, class_name: "User", foreign_key: "player_user_id" # no sé muy bien si estoy funcionará
  belongs_to :target_user, class_name: "User", foreign_key: "target_user_id" # no sé muy bien si estoy funcionará
  belongs_to :winner_user, class_name: "User", foreign_key: "winner_user_id" # no sé muy bien si estoy funcionará
end
