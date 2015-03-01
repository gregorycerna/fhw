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

ActiveRecord::Schema.define(version: 20150301082910) do

  create_table "checkoffs", force: :cascade do |t|
    t.integer  "task_id",    null: false
    t.integer  "did_id",     null: false
    t.boolean  "complete",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "checkoffs", ["did_id"], name: "index_checkoffs_on_did_id"
  add_index "checkoffs", ["task_id"], name: "index_checkoffs_on_task_id"

  create_table "dids", force: :cascade do |t|
    t.datetime "time",       null: false
    t.string   "notes"
    t.integer  "labor_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dids", ["labor_id"], name: "index_dids_on_labor_id"

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.integer  "recipe_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.decimal  "price",      precision: 5, scale: 2
  end

  add_index "ingredients", ["recipe_id"], name: "index_ingredients_on_recipe_id"

  create_table "labors", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.integer  "user_id",     null: false
    t.string   "dueday",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "labors", ["user_id"], name: "index_labors_on_user_id"

  create_table "maintenance_requests", force: :cascade do |t|
    t.string   "name",                        null: false
    t.integer  "user_id",                     null: false
    t.text     "description"
    t.boolean  "done",        default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "maintenance_requests", ["user_id"], name: "index_maintenance_requests_on_user_id"

  create_table "recipes", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "url",           null: false
    t.date     "date_to_serve"
    t.text     "ingredients",   null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "day",           null: false
    t.integer  "user_id"
  end

  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id"

  create_table "tasks", force: :cascade do |t|
    t.string   "description", null: false
    t.integer  "labor_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tasks", ["labor_id"], name: "index_tasks_on_labor_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                                   null: false
    t.integer  "role"
    t.boolean  "isLaborCzar",            default: false, null: false
    t.boolean  "maintenance_officer",    default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "violations", force: :cascade do |t|
    t.string   "description",              null: false
    t.integer  "labor_id",                 null: false
    t.integer  "amount_due",   default: 0, null: false
    t.datetime "date_settled"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "violations", ["labor_id"], name: "index_violations_on_labor_id"

end
