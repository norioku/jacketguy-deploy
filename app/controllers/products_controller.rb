class ProductsController < ApplicationController

def index
	 @all_ranks = Product.find(Favorite.group(:product_id)
	 							.order('count(product_id) desc')
	 							.limit(6) .pluck(:product_id))


	 # @product = Product.find(params[:id])
   @user = current_end_user

end

def show
	 @product = Product.find(params[:id])
	 @all_reviews = @product.reviews
   @user = current_end_user
end

def search
  @user = current_end_user

end

end

