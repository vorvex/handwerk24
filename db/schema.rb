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

ActiveRecord::Schema.define(version: 20180215170601) do

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
    t.string "title"
    t.string "period"
  end

  create_table "partner_requests", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "user_id"
  end

  create_table "partners", force: :cascade do |t|
    t.integer "company_a_id", null: false
    t.integer "company_b_id", null: false
    t.boolean "enabled_by_a"
    t.boolean "enabled_by_b"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_inquieries", force: :cascade do |t|
    t.integer "service_id"
    t.integer "inquiery_id"
  end

  create_table "service_requests", force: :cascade do |t|
    t.string "name"
    t.text "message"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_subcategories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "service_category_id"
    t.index ["service_category_id"], name: "index_service_subcategories_on_service_category_id"
  end

  create_table "service_subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "service_subcategory_id"
    t.index ["service_subcategory_id"], name: "index_service_subjects_on_service_subcategory_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.boolean "show"
    t.integer "service_category_id"
    t.integer "service_subcategory_id"
    t.integer "service_subject_id"
    t.index ["service_category_id"], name: "index_services_on_service_category_id"
    t.index ["service_subcategory_id"], name: "index_services_on_service_subcategory_id"
    t.index ["service_subject_id"], name: "index_services_on_service_subject_id"
  end

  create_table "supports", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.string "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "password_confirmation"
    t.index ["field_id"], name: "index_users_on_field_id"
  end

end
