class UserOrderHistoriesController < ApplicationController

def show
  @user = current_end_user
  @order_history = OrderHistory.find(params[:id])
  @order_histories = OrderHistory.where(end_user_id: @order_history.end_user.id)
end

end
