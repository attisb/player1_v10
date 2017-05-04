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

ActiveRecord::Schema.define(version: 20170503095458) do

  create_table "assets", force: :cascade do |t|
    t.string   "name"
    t.string   "asset_type"
    t.text     "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "ad_asset_file"
    t.string   "menu_type"
  end

  create_table "beer_groups", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "order"
    t.boolean  "visible"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "beer_sizes", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "is_draft"
    t.boolean  "use_tap_lis"
  end

  create_table "beer_styles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "abv_range_start"
    t.integer  "abv_range_end"
    t.boolean  "visible"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "breweries", force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "established"
    t.text     "description"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "website"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "bucket_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "iso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drinks", force: :cascade do |t|
    t.string   "name"
    t.integer  "abv"
    t.integer  "ibu"
    t.boolean  "visible"
    t.integer  "beer_group_id"
    t.integer  "beer_style_id"
    t.integer  "brewery_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "country_id"
    t.integer  "state_id"
    t.text     "description"
    t.string   "short_description"
    t.integer  "color"
    t.boolean  "coming_soon"
    t.string   "image"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  create_table "game_consoles", force: :cascade do |t|
    t.string   "name"
    t.string   "short_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tier"
    t.boolean  "visible"
  end

  create_table "game_consoles_games", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "game_console_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.integer  "game_console_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "cover_image"
    t.string   "hero_image"
    t.integer  "players"
    t.date     "release_date"
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "drink_id"
    t.text     "message"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "make_public"
    t.boolean  "approved"
  end

  create_table "playlist_orders", force: :cascade do |t|
    t.integer  "asset_id"
    t.integer  "playlist_id"
    t.integer  "order"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "playlists", force: :cascade do |t|
    t.string   "name"
    t.string   "direction"
    t.date     "date_show"
    t.boolean  "enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.decimal  "amount"
    t.integer  "drink_id"
    t.integer  "beer_size_id"
    t.boolean  "available"
    t.boolean  "is_new"
    t.boolean  "is_coming_soon"
    t.boolean  "is_returning"
    t.boolean  "is_special"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.boolean  "available"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  create_table "screen_orders", force: :cascade do |t|
    t.integer  "screen_id"
    t.integer  "playlist_id"
    t.integer  "order"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "screens", force: :cascade do |t|
    t.string   "name"
    t.string   "direction"
    t.string   "location"
    t.string   "screen_type"
    t.boolean  "enabled"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "codeword"
    t.boolean  "show_menu"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "iso"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_hads", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "drink_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_wants", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "drink_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "active"
    t.boolean  "admin"
    t.boolean  "moderator"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
