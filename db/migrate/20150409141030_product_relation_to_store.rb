class ProductRelationToStore < ActiveRecord::Migration
  def change
  	add_reference :products, :store, index: true
  end
end
