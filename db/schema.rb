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

ActiveRecord::Schema.define(version: 20131102234827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "babbles", force: true do |t|
    t.integer  "note_id"
    t.string   "body"
    t.boolean  "original_note", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ip_address"
  end

  create_table "notes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "integrity",  default: 1000
    t.integer  "holes",      default: 1
  end

  create_table "reeds", force: true do |t|
    t.integer  "note_id"
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
