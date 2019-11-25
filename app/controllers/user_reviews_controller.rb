class UserReviewsController < ApplicationController

  def index
    @user = current_end_user
    @product = Product.find(params[:id])
    @reviews = Review.where(product_id: @product).order(:id).page(params[:page]).per(5)
  end

  def create
  	product = Product.find(params[:id])
  	review = Review.new(review_params)
  	review.product_id = product.id
  	review.end_user_id = current_end_user.id
    if review.save
      flash[:success] = "レビューを投稿しました"
      redirect_to product_path(product.id)
    else
      flash[:danger] = "レビューが投稿できません"
      redirect_to product_path(product.id)
    end

  end


private

def review_params
	params.require(:review).permit(:review_content)
end

end
