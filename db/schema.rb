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

ActiveRecord::Schema.define(version: 20170420210205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid", using: :btree
  end

  create_table "card_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_sessions_cards", id: false, force: :cascade do |t|
    t.integer "card_session_id", null: false
    t.integer "card_id",         null: false
    t.index ["card_id", "card_session_id"], name: "index_card_sessions_cards_on_card_id_and_card_session_id", using: :btree
    t.index ["card_session_id", "card_id"], name: "index_card_sessions_cards_on_card_session_id_and_card_id", using: :btree
  end

  create_table "cards", force: :cascade do |t|
    t.integer  "image_id",    null: false
    t.integer  "content_id",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "language_id"
    t.integer  "topic_id"
    t.index ["content_id"], name: "index_cards_on_content_id", using: :btree
    t.index ["image_id"], name: "index_cards_on_image_id", using: :btree
  end

  create_table "cards_schichida_sessions", id: false, force: :cascade do |t|
    t.integer "schichida_session_id", null: false
    t.integer "card_id",              null: false
    t.index ["card_id", "schichida_session_id"], name: "idx_cards_ss_on_card_id_and_schichida_session_id", using: :btree
    t.index ["schichida_session_id", "card_id"], name: "idx_cards_ss_on_schichida_session_id_and_card_id", using: :btree
  end

  create_table "contents", force: :cascade do |t|
    t.string   "text",               null: false
    t.string   "audio_file_name",    null: false
    t.string   "audio_content_type", null: false
    t.integer  "audio_file_size",    null: false
    t.datetime "audio_updated_at",   null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "image_file_name",    null: false
    t.string   "image_content_type", null: false
    t.integer  "image_file_size",    null: false
    t.datetime "image_updated_at",   null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "schichida_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_schichida_sessions_on_user_id", using: :btree
  end

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.integer  "language_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["language_id"], name: "index_topics_on_language_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer  "site_language_id"
    t.integer  "cards_language_id"
    t.boolean  "schichida"
    t.boolean  "doman"
    t.boolean  "math"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  end

end
