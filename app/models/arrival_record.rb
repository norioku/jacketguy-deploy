class ArrivalRecord < ApplicationRecord
	validates :arrival_product   , presence: true
	validates :arrival_product_at, presence: true

	belongs_to :product, ->{ with_deleted }
end
