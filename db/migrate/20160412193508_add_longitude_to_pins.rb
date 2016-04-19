class AddLongitudeToPins < ActiveRecord::Migration
  def change
    add_column :pins, :longitude, :float
    add_index :pins, :longitude
  end
end
