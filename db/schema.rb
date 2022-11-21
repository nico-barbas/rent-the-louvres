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

ActiveRecord::Schema[7.0].define(version: 2022_11_21_140227) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artworks", force: :cascade do |t|
    t.string "title"
    t.string "creator"
    t.text "description"
    t.float "width"
    t.float "height"
    t.date "creation_date"
    t.string "type"
    t.float "price_per_day"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_artworks_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "artwork_id", null: false
    t.bigint "user_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.integer "duration"
    t.float "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artwork_id"], name: "index_bookings_on_artwork_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.bigint "artwork_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artwork_id"], name: "index_images_on_artwork_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "artworks", "users"
  add_foreign_key "bookings", "artworks"
  add_foreign_key "bookings", "users"
  add_foreign_key "images", "artworks"
end
