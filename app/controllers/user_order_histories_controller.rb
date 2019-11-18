class UserOrderHistoriesController < ApplicationController

def show
  @user = EndUser.find(params[:id])
  @order_histories = OrderHistory.where(end_user_id:@user)
  @order_history = OrderHistory.find(params[:id])
end

end
