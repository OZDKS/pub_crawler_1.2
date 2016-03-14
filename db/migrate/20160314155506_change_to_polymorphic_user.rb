class ChangeToPolymorphicUser < ActiveRecord::Migration
  def change
  	remove_column :users, :owner_id
  	remove_column :users, :employee_id
  	remove_column :users, :customer_id
  	remove_column :users, :type

  	add_reference :users, :user_type, polymorphic: true, index: true
  end
end
