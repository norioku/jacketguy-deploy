class ChangeColumnToOrderHistory < ActiveRecord::Migration[5.2]
  def change
  	change_column :order_histories, :shipping_status,:intefer,default: 1
  end
end
