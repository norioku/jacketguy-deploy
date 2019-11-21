class UserPurchasesController < ApplicationController

def new
  @user = EndUser.find(params[:id])
  @order_history = OrderHistory.new
  @product_histroy = ProductHistory.new
end

def create

  @user = EndUser.find(params[:id])
  @address = Address.find(params[:order_history][:address_id].to_i)

  @order_history = OrderHistory.new(order_history_params)


  @order_history.end_user_id = @address.end_user_id
  @order_history.last_name = @address.last_name
  @order_history.first_name = @address.first_name
  @order_history.last_kana_name = @address.last_kana_name
  @order_history.first_kana_name = @address.first_kana_name
  @order_history.post_code = @address.post_code
  @order_history.address = @address.address
  @order_history.phone_number = @address.phone_number



  @user.carts.each do |cart|
    @product_history = ProductHistory.new
    @product_history.product_id = cart.product_id
    @product_history.order_quantity = cart.order_quantity
    @product_history.subtotal = cart.order_quantity * cart.product.price
    @product_history.order_history_id = @order_history.id
    @product_history.save
    @order_history.product_total_price = (cart.order_quantity * cart.product.price) + @order_history.shipping_fee
  end

  if @order_history.save
    flash[:success] = "購入が完了しました。"
    @user.carts.destroy
    redirect_to root_url
  else
    flash.now[:danger] = "購入が完了しませんでした。"
    render :new
  end




#   if .save
#     @user.carts.destroy
#     redirect_to users_purchase_complete_path
#   else
#     render :new
#   end
end

def complete
  @user = current_end_user
end

private

  def order_history_params
    params.require(:order_history).permit(:end_user_id, :email, :last_name, :first_name, :last_kana_name, :first_kana_name, :post_code, :address, :phone_number, :product_total_price, :shipping_fee, :shipping_status)
  end



end
# <%= form_with(model: [@product_history, @order_history], local:true) do |f| %>

#       <%= @user.addresses.each do |address| %>
#         <%= f.hidden_field :end_user_id, value => @user.id %>
#         <%= f.hidden_field :email, value => address.email %>
#         <%= f.hidden_field :last_name, value => address.last_name %>
#         <%= f.hidden_field :last_kana_name, value => address.last_kana_name %>
#         <%= f.hidden_field :first_name, value => address.first_name %>
#         <%= f.hidden_field :first_kana_name, value => address.first_kana_name %>
#         <%= f.hidden_field :post_code, value => address.post_code %>
#         <%= f.hidden_field :address, value => address.address %>
#         <%= f.hidden_field :phone_number, value => address.phone_number %>

#       # <% end %>
# <%= f.submit "注文を確定する" %>
#     <% end %>
