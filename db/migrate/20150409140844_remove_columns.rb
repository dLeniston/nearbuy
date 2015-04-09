class RemoveColumns < ActiveRecord::Migration
  def change
  	remove_column :products, :store_id
  	remove_column :products, :user_id
  end
end
