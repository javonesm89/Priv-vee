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

ActiveRecord::Schema.define(version: 2021_01_28_225844) do

  create_table "expenses", force: :cascade do |t|
    t.string "source"
    t.string "amount"
    t.integer "user_id", null: false
    t.integer "planner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["planner_id"], name: "index_expenses_on_planner_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.string "source"
    t.string "amount"
    t.integer "user_id", null: false
    t.integer "planner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["planner_id"], name: "index_incomes_on_planner_id"
    t.index ["user_id"], name: "index_incomes_on_user_id"
  end

  create_table "planners", force: :cascade do |t|
    t.string "month"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_planners_on_user_id"
  end

  create_table "savings", force: :cascade do |t|
    t.string "source"
    t.integer "amount"
    t.integer "user_id", null: false
    t.integer "planner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["planner_id"], name: "index_savings_on_planner_id"
    t.index ["user_id"], name: "index_savings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "expenses", "planners"
  add_foreign_key "expenses", "users"
  add_foreign_key "incomes", "planners"
  add_foreign_key "incomes", "users"
  add_foreign_key "planners", "users"
  add_foreign_key "savings", "planners"
  add_foreign_key "savings", "users"
end
