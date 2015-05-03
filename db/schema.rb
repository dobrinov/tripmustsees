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

ActiveRecord::Schema.define(version: 20150419185242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "country_id"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "default_zoom_level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "general_information"
    t.boolean  "published",           default: false
    t.boolean  "capital",             default: false
    t.integer  "population"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "default_zoom_level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "general_information"
  end

  create_table "images", force: :cascade do |t|
    t.string   "file"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["imageable_id"], name: "index_images_on_imageable_id", using: :btree

  create_table "location_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "type"
    t.integer  "city_id"
    t.integer  "location_category_id"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "default_zoom_level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.text     "history"
    t.string   "website"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
