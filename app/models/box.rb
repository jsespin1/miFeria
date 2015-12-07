class Box < ApplicationRecord
	has_many :box_order_items
	has_many :order_items, :through => :box_order_items
end
