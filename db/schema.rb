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

ActiveRecord::Schema.define(version: 2019_09_16_135346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "check_ins", force: :cascade do |t|
    t.bigint "user_id"
    t.text "comment"
    t.string "type_of_music"
    t.string "photo"
    t.bigint "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_check_ins_on_place_id"
    t.index ["user_id"], name: "index_check_ins_on_user_id"
  end

  create_table "favorite_places", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_favorite_places_on_place_id"
    t.index ["user_id"], name: "index_favorite_places_on_user_id"
  end

  create_table "followings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "following_id"
    t.bigint "follower_id"
    t.index ["follower_id"], name: "index_followings_on_follower_id"
    t.index ["following_id"], name: "index_followings_on_following_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.text "description"
    t.string "place_type"
    t.string "photo"
    t.integer "age_group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "location"
    t.string "gender"
    t.integer "age"
    t.string "username"
    t.text "bio"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "check_ins", "places"
  add_foreign_key "check_ins", "users"
  add_foreign_key "favorite_places", "places"
  add_foreign_key "favorite_places", "users"
  add_foreign_key "followings", "users", column: "follower_id"
  add_foreign_key "followings", "users", column: "following_id"
end
