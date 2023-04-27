class RemoveStatusFromChallenges < ActiveRecord::Migration[7.0]
  def change
    remove_column :challenges, :status, :string
  end
end
