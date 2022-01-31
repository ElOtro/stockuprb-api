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

ActiveRecord::Schema.define(version: 2022_01_25_161217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "agreements", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.date "start_at"
    t.date "end_at"
    t.string "name"
    t.bigint "user_id"
    t.datetime "destroyed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_agreements_on_company_id"
    t.index ["destroyed_at"], name: "index_agreements_on_destroyed_at"
    t.index ["user_id"], name: "index_agreements_on_user_id"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.bigint "organisation_id", null: false
    t.boolean "is_default", default: false
    t.integer "account_type", default: 1
    t.string "name"
    t.jsonb "details", default: {}
    t.datetime "destroyed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["destroyed_at"], name: "index_bank_accounts_on_destroyed_at"
    t.index ["organisation_id"], name: "index_bank_accounts_on_organisation_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "logo"
    t.string "name"
    t.string "full_name"
    t.integer "company_type", default: 1
    t.jsonb "details", default: {}
    t.bigint "user_id"
    t.datetime "destroyed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["destroyed_at"], name: "index_companies_on_destroyed_at"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.integer "role", default: 1
    t.string "title"
    t.string "name"
    t.string "phone"
    t.string "email"
    t.datetime "start_at"
    t.string "sign"
    t.jsonb "details", default: {}
    t.bigint "user_id"
    t.datetime "destroyed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_contacts_on_company_id"
    t.index ["destroyed_at"], name: "index_contacts_on_destroyed_at"
    t.index ["start_at"], name: "index_contacts_on_start_at"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "invoice_items", force: :cascade do |t|
    t.bigint "invoice_id", null: false
    t.integer "position", default: 0
    t.bigint "product_id", null: false
    t.text "description"
    t.bigint "unit_id", null: false
    t.decimal "quantity", precision: 8, scale: 3, default: "0.0"
    t.decimal "price", precision: 15, scale: 2, default: "0.0"
    t.decimal "amount", precision: 15, scale: 2, default: "0.0"
    t.decimal "discount_rate", precision: 15, scale: 2, default: "0.0"
    t.decimal "discount", precision: 15, scale: 2, default: "0.0"
    t.bigint "vat_rate_id", null: false
    t.decimal "vat", precision: 15, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id"], name: "index_invoice_items_on_invoice_id"
    t.index ["product_id"], name: "index_invoice_items_on_product_id"
    t.index ["unit_id"], name: "index_invoice_items_on_unit_id"
    t.index ["vat_rate_id"], name: "index_invoice_items_on_vat_rate_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.boolean "is_active", default: false
    t.datetime "date"
    t.string "number"
    t.bigint "organisation_id", null: false
    t.bigint "bank_account_id", null: false
    t.bigint "company_id", null: false
    t.bigint "agreement_id", null: false
    t.bigint "project_id"
    t.decimal "amount", precision: 15, scale: 2, default: "0.0"
    t.decimal "discount", precision: 15, scale: 2, default: "0.0"
    t.decimal "vat", precision: 15, scale: 2, default: "0.0"
    t.bigint "user_id"
    t.tsvector "search_vector"
    t.datetime "destroyed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["agreement_id"], name: "index_invoices_on_agreement_id"
    t.index ["bank_account_id"], name: "index_invoices_on_bank_account_id"
    t.index ["company_id"], name: "index_invoices_on_company_id"
    t.index ["date"], name: "index_invoices_on_date"
    t.index ["destroyed_at"], name: "index_invoices_on_destroyed_at"
    t.index ["number"], name: "index_invoices_on_number"
    t.index ["organisation_id"], name: "index_invoices_on_organisation_id"
    t.index ["project_id"], name: "index_invoices_on_project_id"
    t.index ["search_vector"], name: "index_invoices_on_search_vector"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "name"
    t.string "full_name"
    t.string "ceo"
    t.string "ceo_title"
    t.string "cfo"
    t.string "cfo_title"
    t.string "stamp"
    t.string "ceo_sign"
    t.string "cfo_sign"
    t.boolean "is_vat_payer", default: false
    t.jsonb "details", default: {}
    t.datetime "destroyed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["destroyed_at"], name: "index_organisations_on_destroyed_at"
  end

  create_table "products", force: :cascade do |t|
    t.boolean "is_active", default: false
    t.integer "product_type"
    t.string "name"
    t.text "description"
    t.string "sku"
    t.decimal "price"
    t.bigint "vat_rate_id", null: false
    t.bigint "unit_id", null: false
    t.bigint "user_id"
    t.tsvector "search_vector"
    t.datetime "destroyed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["destroyed_at"], name: "index_products_on_destroyed_at"
    t.index ["search_vector"], name: "index_products_on_search_vector"
    t.index ["unit_id"], name: "index_products_on_unit_id"
    t.index ["user_id"], name: "index_products_on_user_id"
    t.index ["vat_rate_id"], name: "index_products_on_vat_rate_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.tsvector "search_vector"
    t.datetime "destroyed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["destroyed_at"], name: "index_projects_on_destroyed_at"
    t.index ["search_vector"], name: "index_projects_on_search_vector"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.datetime "destroyed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["destroyed_at"], name: "index_units_on_destroyed_at"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "is_active"
    t.string "name"
    t.integer "role", default: 1
    t.string "title"
    t.string "avatar"
    t.string "phone"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "destroyed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["destroyed_at"], name: "index_users_on_destroyed_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["is_active"], name: "index_users_on_is_active"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vat_rates", force: :cascade do |t|
    t.boolean "is_active", default: false
    t.boolean "is_default", default: false
    t.decimal "rate", precision: 15, scale: 2, default: "0.0"
    t.string "name"
    t.datetime "destroyed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["destroyed_at"], name: "index_vat_rates_on_destroyed_at"
  end

end
