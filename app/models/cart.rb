class Cart < ApplicationRecord

    validates  :order_quantity  ,presence: true

	belongs_to :end_user
	belongs_to :product
end
