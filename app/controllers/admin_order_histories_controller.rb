class AdminOrderHistoriesController < ApplicationController

  before_action :authenticate_admin!, only:[:index, :show, :update]

  def index
    @order_histories = OrderHistory.all
  end

  def show
    @order_history = OrderHistory.find(params[:id])
    @product_histories = ProductHistory.where(order_history_id: @order_history).order(:product_id).page(params[:page]).per(5)
  end

  def update
    @order_history = OrderHistory.find(params[:id])

    if @order_history.update(admin_order_history_params)
      flash[:success] = "発送ステータスを更新しました"
      redirect_to admins_order_histories_path
    else
      flash[:danger] = "発送ステータスの更新に失敗しました"
      render :show
    end
  end

  private

    def admin_order_history_params
      params.require(:order_history).permit(:shipping_status)
    end

end


