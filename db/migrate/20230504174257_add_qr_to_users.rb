class AddQrToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :qr, :string
  end
end
