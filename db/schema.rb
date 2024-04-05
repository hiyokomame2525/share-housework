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

ActiveRecord::Schema[7.0].define(version: 2024_04_02_002755) do
  create_table "houseworks", charset: "utf8", force: :cascade do |t|
    t.boolean "laundry", default: false, null: false
    t.boolean "dishes", default: false, null: false
    t.boolean "cooking", default: false, null: false
    t.boolean "clean_room", default: false, null: false
    t.boolean "bathroom", default: false, null: false
    t.boolean "trash", default: false, null: false
    t.boolean "toilet", default: false, null: false
    t.bigint "pair_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pair_id"], name: "index_houseworks_on_pair_id"
  end

  create_table "pairs", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "partner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_id"], name: "index_pairs_on_partner_id"
    t.index ["user_id", "partner_id"], name: "index_pairs_on_user_id_and_partner_id", unique: true
    t.index ["user_id"], name: "index_pairs_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", default: "", null: false
    t.date "birthday", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "houseworks", "pairs"
  add_foreign_key "pairs", "users"
  add_foreign_key "pairs", "users", column: "partner_id"
end
