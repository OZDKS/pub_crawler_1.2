class AddLocalRefToEmployee < ActiveRecord::Migration
  def change
    add_reference :employees, :local, index: true, foreign_key: true
  end
end
