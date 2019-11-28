class UserCartsController < ApplicationController

	before_action :authenticate_end_user!, only:[:index, :update, :destroy, :create]

	def index
	  @user = current_end_user
	end

	def update
      cart = Cart.find(params[:id])
	  cart.update(cart_params)
	  redirect_to user_carts_path
	end

	def destroy
	  @cart = Cart.find(params[:id])
	  @cart.destroy
	  redirect_to user_carts_path
	end

	def create
		@product = Product.find(params[:id])
	    if Cart.where(product_id: params[:id], end_user_id: current_end_user.id).empty?
			@cart = Cart.new(cart_params)
			@cart.product_id = @product.id
			@cart.end_user_id = current_end_user.id
			if @cart.save
				flash[:success] = "カートに追加しました"
				redirect_to user_carts_path 
			else
				flash.now[:danger] = "カートに追加できませんでした"
				render template: 'products/show' 
			end
    	else
		    @cart = Cart.where(product_id: params[:id], end_user_id: current_end_user.id).first
				@cart.update(order_quantity: params[:cart][:order_quantity].to_i + @cart.order_quantity)
				redirect_to user_carts_path
		end
  end


	private

		def cart_params
	  	params.require(:cart).permit(:order_quantity, :end_user_id, :product_id)
		end
end

