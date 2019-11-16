class Disc < ApplicationRecord
	validates  :disc_num, presence: true

	has_many :songs

	belongs_to :product
end
