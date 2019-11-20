class ProductHistory < ApplicationRecord

	validates :order_quantity ,presence: true

    belongs_to :order_history
    belongs_to :product
end
