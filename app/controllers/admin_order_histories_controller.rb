class AdminOrderHistoriesController < ApplicationController

def index
  @order_histories = OrderHistory.all
end

def show
  @order_history = OrderHistory.find(params[:id])
  @user = EndUser.find(params[:id])
  @products = Product.all
end

def update
  @order_history = OrderHistory.find(params[:id])

  if @order_history.update(admin_order_history_params)
    flash[:notice] = "発送ステータスを更新しました"
    redirect_to admins_order_histories_path
  else
    flash[:notice] = "発送ステータスの更新に失敗しました"
    render :show
  end
end

private

  def admin_order_history_params
    params.require(:order_history).permit(:shipping_status)
  end

end


