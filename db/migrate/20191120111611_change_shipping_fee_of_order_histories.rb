class ChangeShippingFeeOfOrderHistories < ActiveRecord::Migration[5.2]
  def change
    change_column :order_histories, :shipping_fee, :integer, default: 500
  end
end
