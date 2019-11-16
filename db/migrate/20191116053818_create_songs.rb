class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :disc_id
      t.string :name
      t.integer :song_num
      t.timestamps
    end
  end
end
