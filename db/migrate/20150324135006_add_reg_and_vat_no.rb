class AddRegAndVatNo < ActiveRecord::Migration
  def change
  	add_column :users, :reg, :string
  	add_column :users, :vat, :string
  end
end
