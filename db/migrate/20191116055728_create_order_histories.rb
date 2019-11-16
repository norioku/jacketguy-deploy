class CreateOrderHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :order_histories do |t|
      t.integer     :end_user_id
      t.string      :email,              null: false, default: ""
      t.string      :last_name
      t.string      :first_name
      t.string      :last_kana_name
      t.string      :first_kana_name
      t.string      :post_code
      t.string      :address
      t.string      :phone_number
      t.integer     :product_total_price
      t.integer     :shipping_fee
      t.integer     :shipping_status
      t.timestamps
    end
  end
end
