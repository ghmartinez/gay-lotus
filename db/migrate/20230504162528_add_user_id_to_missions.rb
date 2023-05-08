class AddUserIdToMissions < ActiveRecord::Migration[7.0]
  def change
    add_reference :missions, :user, null: false, foreign_key: true
  end
end
