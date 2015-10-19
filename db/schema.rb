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

ActiveRecord::Schema.define(version: 20151019215337) do

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "peers", force: :cascade do |t|
    t.integer  "torrent_id",      limit: 4
    t.string   "peer_id",         limit: 255
    t.integer  "port",            limit: 4
    t.string   "passkey",         limit: 255
    t.integer  "uploaded",        limit: 4,   default: 0
    t.integer  "downloaded",      limit: 4,   default: 0
    t.integer  "to_go",           limit: 4,   default: 0
    t.boolean  "seeder",                      default: false
    t.boolean  "connectable",                 default: false
    t.integer  "user_id",         limit: 4
    t.string   "agent",           limit: 255
    t.datetime "finished_at"
    t.integer  "download_offset", limit: 4,   default: 0
    t.integer  "upload_offset",   limit: 4,   default: 0
    t.datetime "last_action_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "peers", ["connectable"], name: "index_peers_on_connectable", using: :btree
  add_index "peers", ["torrent_id", "peer_id"], name: "index_peers_on_torrent_id_and_peer_id", unique: true, using: :btree

  create_table "torrent_files", force: :cascade do |t|
    t.integer "torrent_id", limit: 4
    t.text    "filename",   limit: 65535
    t.integer "size",       limit: 4
  end

  create_table "torrents", force: :cascade do |t|
    t.string   "info_hash",          limit: 255
    t.string   "name",               limit: 255
    t.integer  "user_id",            limit: 4
    t.string   "filename",           limit: 255
    t.string   "original_filename",  limit: 255
    t.text     "description",        limit: 65535
    t.integer  "category_id",        limit: 4
    t.integer  "size",               limit: 4
    t.integer  "piece_length",       limit: 4
    t.integer  "pieces",             limit: 4
    t.string   "orig_announce_url",  limit: 255
    t.text     "orig_announce_list", limit: 65535
    t.string   "created_by",         limit: 255
    t.string   "torrent_comment",    limit: 255
    t.integer  "numfiles",           limit: 4
    t.integer  "views",              limit: 4,     default: 0
    t.integer  "times_completed",    limit: 4,     default: 0
    t.integer  "leechers",           limit: 4,     default: 0
    t.integer  "seeders",            limit: 4,     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "torrents", ["info_hash"], name: "index_torrents_on_info_hash", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
