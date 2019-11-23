class Product < ApplicationRecord

  validates :title            ,presence: true
  validates :price            ,presence: true
  validates :release_date     ,presence: true


    enum sale_status:{
      販売停止中: 0,
      販売中: 1
    }


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

  scope :search, -> (search_params) do
    return if search_params.blank?

    title_like(search_params[:title])
  end

   scope :title_like, -> (title) { where('title LIKE ?', "%#{title}%") if title.present? }
###いいね機能
   def favorited_by?(end_user)
     favorites.where(end_user_id: end_user.id).exists?
   end
end


