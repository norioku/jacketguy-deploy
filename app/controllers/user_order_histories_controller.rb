class UserOrderHistoriesController < ApplicationController

def show
  @order_history = OrderHistory.find(params[:id])
  @order_histories = OrderHistory.where(end_user_id: @order_history.end_user.id)
end

end
