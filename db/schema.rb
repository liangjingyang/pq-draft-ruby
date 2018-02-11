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

ActiveRecord::Schema.define(version: 20180115074442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_logs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "user_id"
    t.string "action_name"
    t.string "controller_name"
    t.jsonb "params"
    t.datetime "updated_at", null: false
  end

  create_table "box_followers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "box_id"
    t.boolean "allowed", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boxes", force: :cascade do |t|
    t.integer "user_id"
    t.string "image"
    t.string "name"
    t.string "number"
    t.string "qrcode_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "box_id"
    t.text "content"
    t.jsonb "images"
    t.boolean "mini_program", default: false
    t.integer "parent_id"
    t.integer "parent_box_id"
    t.string "parent_box_name"
    t.datetime "last_shared_at"
    t.datetime "last_copied_at"
    t.datetime "last_pasted_at"
    t.integer "copied_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "uid"
    t.string "provider"
    t.string "provider_token"
    t.string "provider_refresh_token"
    t.string "language"
    t.string "country"
    t.string "province"
    t.string "city"
    t.string "sex"
    t.string "encrypted_password", default: "", null: false
    t.string "encrypted_captcha", default: "", null: false
    t.string "image"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
