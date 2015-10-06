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

ActiveRecord::Schema.define(version: 20150211134612) do

  create_table "attaches", force: true do |t|
    t.integer "message_id"
    t.integer "attachable_id"
    t.string  "attachable_type"
  end

  create_table "documents", force: true do |t|
    t.string  "type"
    t.string  "base_url"
    t.integer "foreign_id"
    t.text    "full_url"
    t.text    "title"
  end

  create_table "filters", force: true do |t|
    t.string "type"
    t.string "check_property"
    t.string "check_value"
    t.string "title"
  end

  create_table "filters_outs", id: false, force: true do |t|
    t.integer "filter_id"
    t.integer "out_id"
  end

  create_table "group_classes", force: true do |t|
    t.string "title"
  end

  create_table "group_links", force: true do |t|
    t.integer "group_id"
    t.integer "groupable_id"
    t.string  "groupable_type"
  end

  create_table "groups", force: true do |t|
    t.string  "title"
    t.integer "group_class_id"
  end

  create_table "messagefacts", force: true do |t|
    t.integer  "message_id"
    t.integer  "out_id"
    t.integer  "workpoint_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "messages", force: true do |t|
    t.text     "content",                limit: 16777215
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sender_out_id"
    t.integer  "sender_workpoint_id"
    t.integer  "recipient_workpoint_id"
    t.integer  "is_completed",                            default: 0
    t.integer  "is_accepted",                             default: 0
    t.integer  "is_assigned",                             default: 0
  end

  create_table "outs", force: true do |t|
    t.string   "title"
    t.integer  "next_workpoint_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "workpoint_id"
  end

  create_table "users", force: true do |t|
    t.string   "login"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_hash"
    t.string   "password_salt"
  end

  create_table "workers", force: true do |t|
    t.integer  "workpoint_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workflows", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workpoints", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wowolinks", force: true do |t|
    t.integer  "workflow_id"
    t.integer  "workpoint_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
