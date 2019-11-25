class AdminReviewsController < ApplicationController

def edit
  @review = Review.find(params[:id])
  # @product = Review.find_by(product_id: @review.product_id)
  # @user = Review.find_by(end_user_id: @review.end_user_id)
end

def update
  @review = Review.find(params[:id])

  if @review.update(admin_review_params)
    flash[:success] = "編集を確定しました"
    redirect_to admins_product_url(@review.product)
  else
    flash.now[:danger] = "編集に失敗しました"
    render :edit
  end
end

def destroy
  @review = Review.find(params[:id])
  @review.destroy
  redirect_to admins_product_url(@review.product)
end

private

  def admin_review_params
    params.require(:review).permit(:end_user_id, :product_id, :review_content)
  end

end