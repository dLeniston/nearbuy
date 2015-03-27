class Removeusercolumns < ActiveRecord::Migration
  def change
  	remove_column :users, :reg, :string
  	remove_column :users, :vat, :string
  end
end
