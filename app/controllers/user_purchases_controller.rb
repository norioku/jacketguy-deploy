class UserPurchasesController < ApplicationController

def new
  @user = EndUser.find(params[:id])
  @order_history = OrderHistory.new
  @product_histroy = ProductHistory.new
end

def create
  @user = EndUser.find(params[:id])
  @order_history = OrderHistory.new(order_history_params)
  @order_history = @user.addresses

  @user.carts.each do |cart|
    @product_histroy = ProductHistory.new(product_histroy_params)
    @product_history = cart
    @product_history.subtotal = cart.order_quantity * cart.product.price
    @product_history.save
  end

  if @user.save
    @user.carts.destroy
    redirect_to users_purchase_complete_path
  else
    render :new
  end
end

def complete
  @user = current_end_user
end

private

  def order_histroy_params
    params.require(:order_history).permit(:end_user_id, :email, :last_name, :first_name, :last_kana_name, :first_kana_name, :post_code, :address, :phone_number, :product_total_price, :shipping_fee, :shipping_status)
  end

  def product_history_params
    params.require(:product_history).permit(:order_history_id, :product_id, :order_quantity, :subtotal)
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
