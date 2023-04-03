class ChangeUsersBungalowIdToAllowNull < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :bungalow_id, :bigint, null: true
  end
end
