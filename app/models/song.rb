class Song < ApplicationRecord

	validates  :song_num, presence: true

	belongs_to :disc
end
