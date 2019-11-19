class UserReviewsController < ApplicationController

  def index
    @user = current_end_user
    @product = Product.find(params[:id])
    @reviews = Review.where(product_id: @product)
  end

end
