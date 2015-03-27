class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.string :regno
      t.string :vatno
      t.string :opening

      t.integer :user_id
      t.timestamps
    end
  end
end
