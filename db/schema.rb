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

ActiveRecord::Schema.define(version: 20150804134907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drafts", force: :cascade do |t|
    t.string   "title"
    t.string   "type"
    t.string   "text"
    t.integer  "form_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "drafts", ["form_id"], name: "index_drafts_on_form_id", using: :btree
  add_index "drafts", ["user_id"], name: "index_drafts_on_user_id", using: :btree

  create_table "forms", force: :cascade do |t|
    t.string   "title"
    t.string   "category"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "forms", ["user_id"], name: "index_forms_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string  "text"
    t.string  "answer"
    t.integer "form_id"
  end

  add_index "questions", ["form_id"], name: "index_questions_on_form_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

  add_foreign_key "drafts", "forms"
  add_foreign_key "drafts", "users"
  add_foreign_key "forms", "users"
  add_foreign_key "questions", "forms"
end
