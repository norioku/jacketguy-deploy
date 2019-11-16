class ProductsController < ApplicationController

def index
	 @all_ranks = Product.find(User_favorite.group(:product_id)
	 							.order('count(product_id) descs')
	 							.limit(6) .pluck(:product_id))
	 @product = Product.find(params[:id])
end

def show
	 @product = Product.find(params[:id])
	 @all_reviews = @product.reviews
end

def search
	
end

end
