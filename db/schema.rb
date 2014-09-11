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

ActiveRecord::Schema.define(version: 20140906232938) do

  create_table "comments", force: true do |t|
    t.integer  "episode_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "comments", ["ancestry"], name: "index_comments_on_ancestry"

  create_table "elections", force: true do |t|
    t.string   "name",                      null: false
    t.integer  "max_allowed_vote_per_user"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "episodes", force: true do |t|
    t.string   "name"
    t.string   "permalink"
    t.text     "description"
    t.text     "notes"
    t.datetime "published_at"
    t.integer  "seconds"
    t.text     "file_sizes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "comments_count", default: 0
    t.string   "still"
    t.boolean  "publish"
    t.integer  "position",       default: 0
    t.string   "video_url"
    t.string   "download_url"
    t.integer  "election_id"
    t.integer  "votes_count",    default: 0
    t.boolean  "allow_download"
    t.boolean  "allow_comment"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "episode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  create_table "votes", force: true do |t|
    t.integer  "user_id",     null: false
    t.integer  "episode_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "election_id"
  end

end
