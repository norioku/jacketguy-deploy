class ProductHistory < ApplicationRecord

	validates :order_quantity ,presence: true
    validates :subtotal       ,presence: true

    belongs_to :order_history
    belongs_to :product
end
