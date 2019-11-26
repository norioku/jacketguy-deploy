class UserPurchasesController < ApplicationController

  before_action :authenticate_end_user!, only:[:new, :create, :complete]

  def new
    @user = EndUser.find(params[:id])
    @order_history = OrderHistory.new
    @product_histroy = ProductHistory.new
  end

  def create
    @user = EndUser.find(params[:id])
    @order_history = OrderHistory.new


    if params[:order_history][:address_id].to_i == 0
      @order_history.end_user_id = @user.id
      @order_history.email = @user.email
      @order_history.last_name = @user.last_name
      @order_history.first_name = @user.first_name
      @order_history.last_kana_name = @user.last_kana_name
      @order_history.first_kana_name = @user.first_kana_name
      @order_history.post_code = @user.post_code
      @order_history.address = @user.address
      @order_history.phone_number = @user.phone_number
    else
      @address = Address.find(params[:order_history][:address_id].to_i)
      @order_history.end_user_id = @address.end_user_id
      @order_history.email = @address.email
      @order_history.last_name = @address.last_name
      @order_history.first_name = @address.first_name
      @order_history.last_kana_name = @address.last_kana_name
      @order_history.first_kana_name = @address.first_kana_name
      @order_history.post_code = @address.post_code
      @order_history.address = @address.address
      @order_history.phone_number = @address.phone_number
    end


    @order_history.shipping_status = 0
    @order_history.product_total_price = params[:order_history][:product_total_price].to_i

    if @order_history.save
      @user.carts.each do |cart|
        @product_history = ProductHistory.new
        @product_history.product_id = cart.product_id
        @product_history.order_quantity = cart.order_quantity
        @product_history.subtotal = cart.order_quantity * cart.product.price
        @product_history.order_history_id = @order_history.id
        @product_history.save
        cart.destroy
      end
      redirect_to users_purchase_complete_path
    else
      flash.now[:danger] = "購入が完了しませんでした。"
      render :new
    end

  end

  def complete
    @user = current_end_user
  end

  private

    def order_history_params
      params.require(:order_history).permit(:end_user_id, :address_id, :product_total_price)
    end



end