class Product < ActiveRecord::Base
	belongs_to :store

	validates :store_id, presence: true
	validates :name, presence: true
	validates :description, presence: true
	validates :price, presence: true
	validates :stock, presence: true

	def self.search(search)
		if search
        	find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
      	else
      	    find(:all)
      end
	end

end
