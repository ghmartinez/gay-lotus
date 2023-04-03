class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.text :description
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
