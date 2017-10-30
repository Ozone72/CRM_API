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

ActiveRecord::Schema.define(version: 20171019211323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_form_fields", force: :cascade do |t|
    t.bigint "address_forms_id"
    t.bigint "fields_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_forms_id"], name: "index_address_form_fields_on_address_forms_id"
    t.index ["fields_id"], name: "index_address_form_fields_on_fields_id"
  end

  create_table "address_forms", force: :cascade do |t|
    t.bigint "forms_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forms_id"], name: "index_address_forms_on_forms_id"
  end

  create_table "auths", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.bigint "user_id"
    t.string "token"
    t.index ["token"], name: "index_auths_on_token", unique: true
    t.index ["user_id"], name: "index_auths_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "website"
    t.string "street1"
    t.string "street2"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.string "lat"
    t.string "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_form_fields", force: :cascade do |t|
    t.bigint "contact_forms_id"
    t.bigint "fields_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_forms_id"], name: "index_contact_form_fields_on_contact_forms_id"
    t.index ["fields_id"], name: "index_contact_form_fields_on_fields_id"
  end

  create_table "contact_forms", force: :cascade do |t|
    t.bigint "forms_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forms_id"], name: "index_contact_forms_on_forms_id"
  end

  create_table "field_attributes", force: :cascade do |t|
    t.string "attribute"
    t.bigint "fields_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fields_id"], name: "index_field_attributes_on_fields_id"
  end

  create_table "fields", force: :cascade do |t|
    t.string "input_name"
    t.string "input_type"
    t.string "width"
    t.string "rows"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_users", force: :cascade do |t|
    t.string "order"
    t.string "name"
    t.string "status"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_group_users_on_company_id"
  end

  create_table "groups", force: :cascade do |t|
    t.integer "order"
    t.string "title"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leads", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_leads_on_company_id"
    t.index ["user_id"], name: "index_leads_on_user_id"
  end

  create_table "transaction_form_fields", force: :cascade do |t|
    t.bigint "transaction_forms_id"
    t.bigint "fields_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fields_id"], name: "index_transaction_form_fields_on_fields_id"
    t.index ["transaction_forms_id"], name: "index_transaction_form_fields_on_transaction_forms_id"
  end

  create_table "transaction_forms", force: :cascade do |t|
    t.bigint "forms_id"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forms_id"], name: "index_transaction_forms_on_forms_id"
    t.index ["users_id"], name: "index_transaction_forms_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.date "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "auths", "users"
  add_foreign_key "group_users", "companies"
  add_foreign_key "leads", "companies"
  add_foreign_key "leads", "users"
end
