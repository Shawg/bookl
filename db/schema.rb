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

ActiveRecord::Schema.define(version: 20150320194944) do

  create_table "authors", force: :cascade do |t|
    t.string   "au_lname"
    t.string   "au_fname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.integer "book_id",   null: false
    t.integer "author_id", null: false
  end

  create_table "availabilities", force: :cascade do |t|
    t.date     "day"
    t.time     "startTime"
    t.time     "endTime"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "availabilities_posts", id: false, force: :cascade do |t|
    t.integer "post_id",         null: false
    t.integer "availability_id", null: false
  end

  create_table "books", force: :cascade do |t|
    t.integer  "ISBN"
    t.integer  "volume"
    t.string   "edition"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books_courses", id: false, force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "book_id",   null: false
  end

  create_table "books_posts", id: false, force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "book_id", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "department"
    t.integer  "courseNumber"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages_posts", id: false, force: :cascade do |t|
    t.integer "post_id",    null: false
    t.integer "message_id", null: false
  end

  create_table "messages_user_accounts", id: false, force: :cascade do |t|
    t.integer "message_id",      null: false
    t.integer "user_account_id", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "price"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "posts_user_accounts", id: false, force: :cascade do |t|
    t.integer "post_id",         null: false
    t.integer "user_account_id", null: false
  end

  create_table "user_accounts", force: :cascade do |t|
    t.string   "email"
    t.boolean  "isAdmin?"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
