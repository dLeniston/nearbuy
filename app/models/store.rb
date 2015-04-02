class Store < ActiveRecord::Base
	belongs_to :user 

      validates :user_id, presence: true
      validates :name, presence: true, length: { maximum: 140 }
      validates :address, presence: true, length: { maximum: 200}
      validates :regno, presence: true, uniqueness: true, numericality: {only_integer: true},
      					length: {in: 5..9}
      validates :vatno, presence: true, uniqueness: true, length: {is: 10}
      validates :opening, presence: true, length: {maximum: 200}
      validates :lat, presence: true
      validates :long, presence: true
      default_scope order: 'microposts.created_at DESC'
end
