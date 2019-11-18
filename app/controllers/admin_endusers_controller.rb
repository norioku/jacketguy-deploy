class AdminEndusersController < ApplicationController

	def index
		@users = EndUser.all
	end

	def show
		@user = EndUser.find(params[:id])
		@order_histories = OrderHistory.where(end_user_id:@user)
	end

	def edit
	end

	def create
	end

	def destroy
	end

end1