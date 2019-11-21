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

	  private

	def cart_params
  		params.require(:cart).permit(:order_quantity)
	end
end

