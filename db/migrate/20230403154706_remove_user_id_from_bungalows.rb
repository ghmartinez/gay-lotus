class RemoveUserIdFromBungalows < ActiveRecord::Migration[7.0]
  def change
    remove_column :bungalows, :user_id, :integer
  end
end
