class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :address
      t.string :regno
      t.string :vatno
      t.string :opening
      t.string :latitude
      t.string :longitude

      t.integer :user_id
      t.timestamps
    end
  end
end
