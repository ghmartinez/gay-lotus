class AddTargetAndWinnerUsersToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_reference :challenges, :target_user, foreign_key: { to_table: :users }
    add_reference :challenges, :winner_user, foreign_key: { to_table: :users }
  end
end
