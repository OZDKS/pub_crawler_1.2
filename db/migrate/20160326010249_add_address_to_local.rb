class AddAddressToLocal < ActiveRecord::Migration
  def change
    add_column :locals, :address, :string
  end
end
