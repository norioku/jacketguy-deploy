class OrderHistory < ApplicationRecord

  validates :last_name            ,presence: true
  validates :first_name           ,presence: true
  validates :last_kana_name       ,presence: true
  validates :first_kana_name      ,presence: true
  validates :post_code            ,presence: true
  validates :address              ,presence: true
  validates :phone_number         ,presence: true
  validates :product_total_price  ,presence: true
  validates :shipping_fee         ,presence: true
  validates :shipping_status      ,presence: true

  belongs_to :end_user

  has_many   :product_histories   ,dependent: :destroy

  enum shipping_status:[:未発送, :発送済]

end









