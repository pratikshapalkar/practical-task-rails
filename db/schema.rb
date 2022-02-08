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

ActiveRecord::Schema.define(version: 2022_02_08_102201) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string "award"
    t.integer "gold_medal"
    t.integer "silver_medal"
    t.integer "bronze_medal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_id"
    t.string "player_name"
    t.index ["player_id"], name: "index_achievements_on_player_id"
    t.index ["player_name"], name: "index_achievements_on_player_name"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "comment_no"
    t.string "user_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "post_title"
    t.integer "post_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["post_title"], name: "index_comments_on_post_title"
  end

  create_table "players", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "country"
    t.bigint "phone"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "sport_id"
    t.string "name"
    t.string "image"
    t.index ["sport_id"], name: "index_players_on_sport_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "player_name"
    t.integer "player_id"
    t.string "name_of_player"
    t.integer "sport_id"
    t.string "sport_name"
    t.index ["name_of_player"], name: "index_posts_on_name_of_player"
    t.index ["player_id"], name: "index_posts_on_player_id"
    t.index ["player_name"], name: "index_posts_on_player_name"
    t.index ["sport_id"], name: "index_posts_on_sport_id"
    t.index ["sport_name"], name: "index_posts_on_sport_name"
  end

  create_table "sports", force: :cascade do |t|
    t.string "sport_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "no_of_players"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "players", "users"
end
