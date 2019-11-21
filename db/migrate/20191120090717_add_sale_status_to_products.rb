class AddSaleStatusToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :sale_status, :integer, default: 0, null: false, limit: 1
  end
end
