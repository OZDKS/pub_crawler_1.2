class RemoveNameFromOwners < ActiveRecord::Migration
  def change
  	remove_column :owners, :name
  	remove_column :owners, :surname
  	remove_column :employees, :name
  	remove_column :employees, :surname
  	remove_column :customers, :name
  	remove_column :customers, :surname

  	add_column :users, :name, :string
  	add_column :users, :surname, :string
  end
end
