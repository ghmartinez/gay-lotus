class RemovePlayerUserColumnFromMissions < ActiveRecord::Migration[7.0]
  def change
    remove_column :missions, :player_user_id
  end
end
