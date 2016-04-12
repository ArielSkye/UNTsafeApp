class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :recipient
      t.string :phone

      t.timestamps null: false
    end
  end
end
