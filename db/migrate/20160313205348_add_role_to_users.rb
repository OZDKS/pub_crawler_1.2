class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :type, :string
  end
end
