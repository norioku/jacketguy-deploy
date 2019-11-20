class AdminReviewsController < ApplicationController

def edit
  @review = Review.find(params[:id])
  @product = Review.select(:product_id)
  binding.pry
  @user = Review.select(:end_user_id)
  
  

end

def update
end

def destroy
  @review = Review.find(params[:id])
  @review.destroy
  redirect_to admins_products_path
end

end