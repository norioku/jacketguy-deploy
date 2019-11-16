class CreateProductHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_histories do |t|
      t.integer  :order_history_id
      t.integer  :product_id
      t.integer  :order_quantity
      t.integer  :subtotal

      t.timestamps
    end
  end
end
