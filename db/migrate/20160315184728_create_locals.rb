class CreateLocals < ActiveRecord::Migration
  def change
    create_table :locals do |t|
      t.references :owner, index: true, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
