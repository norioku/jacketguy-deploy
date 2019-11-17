class UserReviewsController < ApplicationController

def index
  # @products = Products.all
  @user = EndUser.find(params[:id])

end

end
