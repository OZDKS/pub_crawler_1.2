class DropLocalsTable < ActiveRecord::Migration
  def change
  	drop_table :locals
  end
end
