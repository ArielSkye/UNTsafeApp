class AddLatitudeToPins < ActiveRecord::Migration
  def change
    add_column :pins, :latitude, :float
    add_index :pins, :latitude
  end
end
