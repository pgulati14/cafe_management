# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_29_190703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "menu_items", force: :cascade do |t|
    t.string "menu_id"
    t.string "menu_item_name"
    t.string "menu_item_price"
  end

  create_table "menus", force: :cascade do |t|
    t.string "menu_name"
    t.boolean "active"
    t.string "menu_id"
    t.string "name"
  end

  create_table "order_items", force: :cascade do |t|
    t.string "order_id"
    t.string "menu_item_id"
    t.string "menu_item_name"
    t.float "menu_item_price"
    t.float "price"
    t.integer "quantity"
  end

  create_table "orders", force: :cascade do |t|
    t.string "user_id"
    t.datetime "delivered_at"
    t.float "total_price"
    t.string "status"
    t.datetime "ordered_at"
    t.datetime "date"
    t.boolean "add_to_cart"
    t.boolean "place_order"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
