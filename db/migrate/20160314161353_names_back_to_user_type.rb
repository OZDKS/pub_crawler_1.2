
class NamesBackToUserType < ActiveRecord::Migration
  def change
	add_column :owners, :name, :string
  	add_column :owners, :surname, :string


	add_column :employees, :name, :string
  	add_column :employees, :surname, :string

  	add_column :customers, :username, :string

  	remove_column :users, :name
  	remove_column :users, :surname
  end
end
