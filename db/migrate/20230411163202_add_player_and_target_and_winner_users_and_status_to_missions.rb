class AddPlayerAndTargetAndWinnerUsersAndStatusToMissions < ActiveRecord::Migration[7.0]
  def change
    add_reference :missions, :player_user, foreign_key: { to_table: :users }
    add_reference :missions, :target_user, foreign_key: { to_table: :users }
    add_reference :missions, :winner_user, foreign_key: { to_table: :users }
    add_column :missions, :status, :string
  end
end
