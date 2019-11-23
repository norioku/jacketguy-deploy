class UserFavoritesController < ApplicationController

	def create
		@product = Product.find(params[:id])
	            favorite = current_end_user.favorites.new(product_id: @product.id)
	            favorite.save

	end

	def destroy
		@product = Product.find(params[:id])
	            favorite = current_end_user.favorites.find_by(product_id: @product.id)
	            favorite.destroy

	end

end


