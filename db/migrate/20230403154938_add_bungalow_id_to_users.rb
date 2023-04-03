class AddBungalowIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :bungalow, null: false, foreign_key: true
  end
end
