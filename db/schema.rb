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

ActiveRecord::Schema.define(version: 20150819234008) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "au_lname",   null: false
    t.string   "au_fname",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "book_id"
  end

  create_table "books", force: :cascade do |t|
    t.integer  "isbn"
    t.integer  "volume"
    t.string   "edition"
    t.string   "title",                          null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_account_id",                null: false
    t.boolean  "active",          default: true, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "department"
    t.integer  "course_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "book_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "price"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "book_id",     null: false
  end

  create_table "user_accounts", force: :cascade do |t|
    t.string   "email",                                  null: false
    t.boolean  "isAdmin?",               default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "password_digest"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_foreign_key "authors", "books"
  add_foreign_key "books", "user_accounts"
  add_foreign_key "courses", "books"
  add_foreign_key "posts", "books", name: "book_id"
end
