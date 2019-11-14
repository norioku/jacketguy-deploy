class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # acts_as_paranoid

  validates :last_name, presence: true
  validates :first_name,  presence: true
  validates :last_kana_name,  presence: true
  validates :first_kana_name,  presence: true
  validates :post_code, :address,  presence: true
  validates :phone_number,  presence: true

end
