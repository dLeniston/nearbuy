class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.string :stock
      t.string :int
      t.integer :store_id

      t.timestamps
    end
  end
end
