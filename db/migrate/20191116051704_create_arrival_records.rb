class CreateArrivalRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :arrival_records do |t|
      t.integer           :product_id
      t.datetime          :arrival_product_at
      t.integer           :arrival_product
      t.timestamps
    end
  end
end
