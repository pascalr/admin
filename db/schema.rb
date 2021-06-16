# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_01_190121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bill_items", force: :cascade do |t|
    t.bigint "bill_id", null: false
    t.integer "part_id"
    t.string "description"
    t.float "quantity"
    t.float "price"
    t.float "tps"
    t.float "tvq"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bill_id"], name: "index_bill_items_on_bill_id"
  end

  create_table "bills", force: :cascade do |t|
    t.date "day"
    t.bigint "supplier_id", null: false
    t.float "shipping_cost"
    t.boolean "items_received"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["supplier_id"], name: "index_bills_on_supplier_id"
  end

  create_table "part_list_items", force: :cascade do |t|
    t.integer "part_id"
    t.integer "item_id"
    t.float "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.float "quantity"
    t.float "price"
    t.date "day"
    t.bigint "part_id", null: false
    t.bigint "supplier_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "tps"
    t.float "tvq"
    t.float "shipping_cost"
    t.boolean "item_received"
    t.index ["part_id"], name: "index_purchases_on_part_id"
    t.index ["supplier_id"], name: "index_purchases_on_supplier_id"
  end

  create_table "shopping_items", force: :cascade do |t|
    t.integer "supplier_id"
    t.string "title"
    t.string "comment"
    t.float "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spendings", force: :cascade do |t|
    t.string "description"
    t.float "cost"
    t.date "day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone_number"
    t.string "email"
    t.string "contact_name"
    t.string "website"
  end

  add_foreign_key "bill_items", "bills"
  add_foreign_key "bills", "suppliers"
  add_foreign_key "purchases", "parts"
  add_foreign_key "purchases", "suppliers"
end
