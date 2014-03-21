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

ActiveRecord::Schema.define(version: 20140321071333) do

  create_table "edits", force: true do |t|
    t.text     "proofread"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "listing_id"
    t.integer  "requester_id"
    t.integer  "editor_id"
    t.text     "comments"
    t.integer  "word_count"
    t.integer  "one_score"
    t.text     "one_reason"
    t.text     "one_suggestion"
    t.integer  "two_score"
    t.text     "two_reason"
    t.text     "two_suggestion"
    t.integer  "three_score"
    t.text     "three_reason"
    t.text     "three_suggestion"
    t.integer  "four_score"
    t.text     "four_reason"
    t.text     "four_suggestion"
  end

  


  create_table "listings", force: true do |t|
    t.text     "prompt"
    t.text     "application"
    t.string   "option"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "word_count"
    t.decimal  "price"
    t.text     "comments"
  end

  


  create_table "orders", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "listing_id"
    t.integer  "customer_id"
    t.decimal  "amount"
  end

  create_table "payments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "proofreader_id"
    t.string   "legalname"
    t.decimal  "request"
  end

  create_table "proofread1s", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "editor_id"
    t.integer  "edit_id"
  end

  
 

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",               null: false
    t.string   "encrypted_password",     default: "",               null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "admin",                  default: false
    t.boolean  "editor",                 default: false
    t.text     "bio"
    t.string   "recipient"
    t.decimal  "balance",                default: 0.0
    
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
