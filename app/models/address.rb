class Address < ApplicationRecord

  validates :last_name,           presence: true
  validates :first_name,          presence: true
  validates :last_kana_name,      presence: true
  validates :first_kana_name,     presence: true
  validates :post_code, :address, presence: true
  validates :phone_number,        presence: true

  belongs_to :end_user
end
