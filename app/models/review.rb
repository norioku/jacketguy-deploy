class Review < ApplicationRecord
    validates  :review_content, presence: true

	belongs_to :end_user
	belongs_to :product


end
