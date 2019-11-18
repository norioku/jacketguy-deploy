class UserCartsController < ApplicationController
	
	def edit
	  @user = EndUser.find(params[:id])
	  @carts = Cart.where(end_user_id:@user)
	end

	def update
      @carts = Cart.where(end_user_id:@user)
	  if @carts.update(inquiry_params)
	  	 redirect_to admins_inquiry_path(@inquiry)
	  else
	  	render
	  end
	end

	def destroy
	end
end

