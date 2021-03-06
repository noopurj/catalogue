# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170327142855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.text     "description"
  end

  create_table "categories_products", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "product_id",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "category_ids"
    t.text     "subcategory_ids"
    t.text     "subsubcategory_ids"
  end

  create_table "products_subcategories", id: false, force: :cascade do |t|
    t.integer "subcategory_id", null: false
    t.integer "product_id",     null: false
  end

  create_table "products_subsubcategories", id: false, force: :cascade do |t|
    t.integer "subsubcategory_id", null: false
    t.integer "product_id",        null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.string   "name"
    t.text     "description"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id", using: :btree

  create_table "subsubcategories", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "subcategory_id"
    t.string   "name"
    t.text     "description"
  end

  add_index "subsubcategories", ["subcategory_id"], name: "index_subsubcategories_on_subcategory_id", using: :btree

  add_foreign_key "subcategories", "categories"
  add_foreign_key "subsubcategories", "subcategories"
end
