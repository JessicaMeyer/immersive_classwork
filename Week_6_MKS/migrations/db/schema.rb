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

ActiveRecord::Schema.define(version: 20150105212744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classmates", force: true do |t|
    t.string  "name"
    t.string  "hair_color"
    t.integer "age"
  end

  create_table "jtcustomers", force: true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
  end

  add_index "jtcustomers", ["email"], name: "index_jtcustomers_on_email", unique: true, using: :btree

  create_table "jtorders", force: true do |t|
    t.integer  "customer_id"
    t.date     "date"
    t.float    "total_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jtsellers", force: true do |t|
    t.string "company_name"
  end

  create_table "products", force: true do |t|
    t.string  "description"
    t.float   "price"
    t.integer "seller_id"
    t.string  "product_name"
    t.integer "num_available"
  end

  create_table "users", force: true do |t|
    t.string  "hair_color"
    t.integer "age"
    t.string  "first_name"
    t.string  "last_name"
    t.integer "ssn"
  end

  add_index "users", ["ssn"], name: "index_users_on_ssn", unique: true, using: :btree

end
