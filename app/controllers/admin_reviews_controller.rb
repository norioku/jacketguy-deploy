class AdminReviewsController < ApplicationController

  before_action :authenticate_admin!, only:[:edit, :update, :destroy]

  def edit
    @review = Review.find(params[:id])
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