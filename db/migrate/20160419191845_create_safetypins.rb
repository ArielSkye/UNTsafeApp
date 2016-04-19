class CreateSafetypins < ActiveRecord::Migration
  def change
    create_table :safetypins do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :description

      t.timestamps null: false
    end
  end
end
