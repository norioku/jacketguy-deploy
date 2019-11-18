class Disc < ApplicationRecord
	validates  :disc_num, presence: true

	has_many :songs

	belongs_to :product

	accepts_nested_attributes_for :songs, allow_destroy: true
end
