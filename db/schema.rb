# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema.define(version: 2019_11_21_054000) do

  create_table "addresses", force: :cascade do |t|
    t.integer "end_user_id"
    t.string "email", default: "", null: false
    t.string "last_name"
    t.string "first_name"
    t.string "last_kana_name"
    t.string "first_kana_name"
    t.string "post_code"
    t.string "address"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "arrival_records", force: :cascade do |t|
    t.integer "product_id"
    t.datetime "arrival_product_at"
    t.integer "arrival_product"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer "product_id"
    t.integer "end_user_id"
    t.integer "order_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discs", force: :cascade do |t|
    t.integer "product_id"
    t.integer "disc_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "end_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "last_name"
    t.string "first_name"
    t.string "last_kana_name"
    t.string "first_kana_name"
    t.string "post_code"
    t.string "address"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_end_users_on_deleted_at"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "end_user_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "end_user_name"
    t.string "subject"
    t.text "content"
    t.text "reply"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "status"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_histories", force: :cascade do |t|
    t.integer "end_user_id"
    t.string "email", default: "", null: false
    t.string "last_name"
    t.string "first_name"
    t.string "last_kana_name"
    t.string "first_kana_name"
    t.string "post_code"
    t.string "address"
    t.string "phone_number"
    t.integer "product_total_price"
    t.integer "shipping_fee", default: 500
    t.integer "shipping_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_histories", force: :cascade do |t|
    t.integer "order_history_id"
    t.integer "product_id"
    t.integer "order_quantity"
    t.integer "subtotal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "artist_id"
    t.integer "label_id"
    t.integer "genre_id"
    t.string "title"
    t.string "product_image_id"
    t.integer "price"
    t.date "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "sale_status", limit: 1, default: 0, null: false
    t.index ["deleted_at"], name: "index_products_on_deleted_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "end_user_id"
    t.integer "product_id"
    t.text "review_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.integer "disc_id"
    t.string "name"
    t.integer "song_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
