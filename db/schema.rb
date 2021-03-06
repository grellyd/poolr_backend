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

ActiveRecord::Schema.define(version: 20160924135222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.float    "lat"
    t.float    "lon"
    t.string   "addr"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_locations_on_user_id", using: :btree
  end

  create_table "trips", force: :cascade do |t|
    t.date     "date"
    t.time     "arrival"
    t.boolean  "isDriver"
    t.integer  "origin_location_id"
    t.integer  "destination_location_id"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["destination_location_id"], name: "index_trips_on_destination_location_id", using: :btree
    t.index ["origin_location_id"], name: "index_trips_on_origin_location_id", using: :btree
    t.index ["user_id"], name: "index_trips_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "fName"
    t.string   "lName"
    t.integer  "credits"
    t.float    "rating"
    t.string   "onBoarding"
    t.boolean  "verifiedDriver"
    t.string   "field"
    t.string   "gender"
    t.string   "profilePic"
    t.string   "description"
    t.integer  "trips_id"
    t.integer  "home_location_id"
    t.integer  "work_location_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["home_location_id"], name: "index_users_on_home_location_id", using: :btree
    t.index ["trips_id"], name: "index_users_on_trips_id", using: :btree
    t.index ["work_location_id"], name: "index_users_on_work_location_id", using: :btree
  end

end
