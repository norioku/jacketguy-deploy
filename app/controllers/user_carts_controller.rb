class UserCartsController < ApplicationController

	def index
	  @user = current_end_user
	end

	def update
    @cart = Cart.find(params[:id])
	  @cart.update(cart_params)
	  redirect_to user_carts_path
	end

	def destroy
	  @cart = Cart.find(params[:id])
	  @cart.destroy
	  redirect_to user_carts_path

	end

	def create
	  carts = Cart.new(cart_params)
	  product = Product.find(params[:id])
	  carts.product_id = product.id
	  carts.end_user_id = current_end_user.id
	  carts.save
	  redirect_to user_carts_path
    end


	  private

	def cart_params
  		params.require(:cart).permit(:order_quantity, :end_user_id, :product_id)
	end
end

