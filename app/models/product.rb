class Product < ApplicationRecord

  validates :title            ,presence: true
  # validates :product_image_id ,presence: true
  validates :price            ,presence: true
  validates :release_date     ,presence: true

  belongs_to :artist
  belongs_to :label
  belongs_to :genre

  has_many :favorites         ,dependent: :destroy
  has_many :reviews           ,dependent: :destroy
  has_many :arrival_records
  has_many :discs			        ,dependent: :destroy
  has_many :carts             ,dependent: :destroy
  has_many :product_histories ,dependent: :destroy

  attachment :product_image
  accepts_nested_attributes_for :discs, allow_destroy: true
  acts_as_paranoid
end


