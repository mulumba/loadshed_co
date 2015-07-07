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

ActiveRecord::Schema.define(version: 20150707132629) do

  create_table "regions", force: :cascade do |t|
    t.string   "region",      limit: 255
    t.text     "region_code", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string   "day",            limit: 255
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "region",         limit: 255
    t.string   "city",           limit: 255
    t.text     "affected_areas", limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "region_id",      limit: 4
  end

  add_index "schedules", ["region_id"], name: "index_schedules_on_region_id", using: :btree

  create_table "searchjoy_searches", force: :cascade do |t|
    t.string   "search_type",      limit: 255
    t.string   "query",            limit: 255
    t.string   "normalized_query", limit: 255
    t.integer  "results_count",    limit: 4
    t.datetime "created_at"
    t.integer  "convertable_id",   limit: 4
    t.string   "convertable_type", limit: 255
    t.datetime "converted_at"
  end

  add_index "searchjoy_searches", ["convertable_id", "convertable_type"], name: "index_searchjoy_searches_on_convertable_id_and_convertable_type", using: :btree
  add_index "searchjoy_searches", ["created_at"], name: "index_searchjoy_searches_on_created_at", using: :btree
  add_index "searchjoy_searches", ["search_type", "created_at"], name: "index_searchjoy_searches_on_search_type_and_created_at", using: :btree
  add_index "searchjoy_searches", ["search_type", "normalized_query", "created_at"], name: "index_searchjoy_searches_on_search_type_and_normalized_query_an", using: :btree

  add_foreign_key "schedules", "regions"
end
