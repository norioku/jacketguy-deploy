class UserReviewsController < ApplicationController

  def index
    @products = Products.find(params[:id])
    @user = EndUser.find(params[:end_user_id])
    @review = Review.find(params[:review_id])
  end

end
