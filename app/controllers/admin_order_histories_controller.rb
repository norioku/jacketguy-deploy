class AdminOrderHistoriesController < ApplicationController

def index
  @order_histories = OrderHistory.all
end

def show
  @order_history = OrderHistory.find(params[:id])
  @order_histories = OrderHistory.where(end_user_id: @order_history.end_user)

  # @order_histories.each do |order_history|
  #   order_history.product_histories.each do |product_history|
  #     @product_history.subtotal = product_history.product.price * product_history.order_quantity
  #   end
  # end

  # @product_history.subtotal.save


  # binding.pry
  # @product_history.subtotal = @product_histories.order_quantity * @product.price
  # @order_history.product_total_price = @product.price * @product_histories.order_quantity

  # productのpriceとproduct_historyのorder_quantityを掛ける→product_historyのsubtotal
  # productのsubtotalを商品の数分足して、さらにshipping_feeを足す→order_historyのproduct_total_price
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


