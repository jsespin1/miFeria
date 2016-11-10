class OrderStatus < ApplicationRecord

	has_many :orders
	#id: 1, name: "In Progress"
	#id: 2, name: "Placed"
	#id: 3, name: "Shipped"
	#id: 4, name: "Cancelled"

end
