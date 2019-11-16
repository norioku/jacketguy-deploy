class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer	   :artist_id
      t.integer    :label_id
      t.integer    :genre_id
      t.string     :title
      t.string     :product_image_id
      t.integer	   :price
      t.date       :release_date
      t.string     :sale_status




      t.timestamps
    end
  end
end



