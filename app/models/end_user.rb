class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable,  :validatable

  validates :last_name,           presence: true
  validates :first_name,          presence: true
  validates :last_kana_name,      presence: true
  validates :first_kana_name,     presence: true
  validates :post_code, :address, presence: true
  validates :phone_number,        presence: true

  has_many :favorites, dependent: :destroy
  has_many :reviews,   dependent: :destroy
  has_many :addresses,   dependent: :destroy
  has_many :order_histories,   dependent: :destroy
  has_many :carts             ,dependent: :destroy


  acts_as_paranoid

end
