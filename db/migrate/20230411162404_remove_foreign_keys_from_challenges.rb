class RemoveForeignKeysFromChallenges < ActiveRecord::Migration[7.0]
  def change
    remove_column :challenges, :target_user_id, foreign_key: true
    remove_column :challenges, :winner_user_id, foreign_key: true
  end
end
