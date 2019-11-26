class ProductsController < ApplicationController



  def index
  	 @all_ranks = Product.find(Favorite.group(:product_id)
  	 							.order('count(product_id) desc')
  	 							.limit(5) .pluck(:product_id))

   @user = current_end_user
   @new_products = Product.page(params[:page]).order(release_date: :desc)
   @genres = Genre.all

  end

  def show
     @product = Product.find(params[:id])
     @reviews = @product.reviews.limit(5)
     @user = current_end_user
     @review = Review.new
     @arrival_stocks = @product.arrival_records.all.sum(:arrival_product)
     @history_stocks = @product.product_histories.all.sum(:order_quantity)
     @stocks = @arrival_stocks - @history_stocks
     @cart = Cart.new
  end

def search
  @user = current_end_user
  @genres = Genre.all
  @products = Product.page(params[:page]).per(10)
end

end

