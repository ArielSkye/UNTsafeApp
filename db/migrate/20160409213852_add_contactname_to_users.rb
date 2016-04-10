class AddContactnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :contactname, :string
  end
end
