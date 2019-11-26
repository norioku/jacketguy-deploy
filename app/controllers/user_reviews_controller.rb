class UserReviewsController < ApplicationController

  before_action :authenticate_end_user!, only:[:create]

  def index
    @user = current_end_user
    @product = Product.find(params[:id])
    @reviews = Review.where(product_id: @product).order(:id).page(params[:page]).per(5)
  end

  def create
    product = Product.find(params[:id])
    if Review.exists?(end_user_id: current_end_user, product_id: product.id)
       flash[:danger] = "この商品はすでにレビュー済みです"
       redirect_to product_path(product.id)
    else
      review = Review.new(review_params)
      review.end_user_id = current_end_user.id
      review.product_id = product.id
      review.save
      flash[:success] = "レビューを投稿しました"
      redirect_to product_path(product.id)

    end

  end

  private

    def review_params
    	params.require(:review).permit(:review_content,:end_user_id,:product_id)
    end

end
