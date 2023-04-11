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

ActiveRecord::Schema[7.0].define(version: 2023_04_11_163202) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bungalows", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "missions", force: :cascade do |t|
    t.bigint "challenge_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "player_user_id"
    t.bigint "target_user_id"
    t.bigint "winner_user_id"
    t.string "status"
    t.index ["challenge_id"], name: "index_missions_on_challenge_id"
    t.index ["player_user_id"], name: "index_missions_on_player_user_id"
    t.index ["target_user_id"], name: "index_missions_on_target_user_id"
    t.index ["winner_user_id"], name: "index_missions_on_winner_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "telegram_user"
    t.bigint "bungalow_id"
    t.index ["bungalow_id"], name: "index_users_on_bungalow_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "missions", "challenges"
  add_foreign_key "missions", "users", column: "player_user_id"
  add_foreign_key "missions", "users", column: "target_user_id"
  add_foreign_key "missions", "users", column: "winner_user_id"
  add_foreign_key "users", "bungalows"
end
