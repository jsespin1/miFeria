class BoxOrderItem < ApplicationRecord
	belongs_to :box
  	belongs_to :order_item
end
