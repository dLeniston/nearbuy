class RemoveLatLng < ActiveRecord::Migration
  def change
  	remove_column :stores, :lat
	remove_column :stores, :lng
  end
end
