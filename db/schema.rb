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

ActiveRecord::Schema.define(version: 20180201132042) do

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fields", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inquieries", force: :cascade do |t|
    t.integer "plz"
    t.string "email"
    t.string "vorname"
    t.string "nachname"
    t.string "adresse"
    t.string "stadt"
    t.string "nachricht"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_inquieries", force: :cascade do |t|
    t.integer "service_id"
    t.integer "inquiery_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.boolean "show"
  end

  create_table "user_inquieries", force: :cascade do |t|
    t.integer "user_id"
    t.integer "inquiery_id"
  end

  create_table "user_services", force: :cascade do |t|
    t.integer "user_id"
    t.integer "service_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "inhaber"
    t.string "email"
    t.string "url"
    t.integer "plz"
    t.string "stadt"
    t.string "adresse"
    t.string "telefon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "field_id"
    t.float "score"
    t.boolean "bulletproof", default: false
    t.index ["field_id"], name: "index_users_on_field_id"
  end

end
