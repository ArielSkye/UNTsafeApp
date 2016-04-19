class AddAddressToPins < ActiveRecord::Migration
  def change
    add_column :pins, :address, :string
    add_index :pins, :address
  end
end
