class RemoveUsersFromMissions < ActiveRecord::Migration[7.0]
  def change
    remove_column :missions, :user_id, foreign_key: true
  end
end
