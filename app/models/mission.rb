class Mission < ApplicationRecord
  belongs_to :challenge
  belongs_to :user
  belongs_to :target_user, class_name: "User", foreign_key: "target_user_id"
  belongs_to :winner_user, class_name: "User", foreign_key: "winner_user_id", optional: true
end
