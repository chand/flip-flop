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

ActiveRecord::Schema.define(version: 20160629154119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.string   "congress",                 null: false
    t.string   "bill",                     null: false
    t.string   "title"
    t.string   "sponsor"
    t.string   "sponsor_id"
    t.string   "introduced_date"
    t.string   "cosponsors"
    t.string   "committees"
    t.string   "latest_major_action_date"
    t.string   "latest_major_action"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "bills", ["bill"], name: "index_bills_on_bill", using: :btree

  create_table "bills_subjects", force: :cascade do |t|
    t.integer  "bill_id",    null: false
    t.integer  "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bills_subjects", ["bill_id"], name: "index_bills_subjects_on_bill_id", using: :btree
  add_index "bills_subjects", ["subject_id"], name: "index_bills_subjects_on_subject_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", using: :btree

  create_table "interests", force: :cascade do |t|
    t.integer  "politician_id", null: false
    t.integer  "issue_id",      null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "issues", force: :cascade do |t|
    t.string   "name",                    null: false
    t.string   "keywords",   default: [],              array: true
    t.string   "slug"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "image"
  end

  create_table "legislators", force: :cascade do |t|
    t.string   "bioguide_id",          null: false
    t.string   "chamber",              null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "party"
    t.string   "twitter_account"
    t.string   "seniority"
    t.string   "next_election"
    t.string   "total_votes"
    t.string   "missed_votes"
    t.string   "total_present"
    t.string   "state"
    t.string   "missed_votes_pct"
    t.string   "votes_with_party_pct"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "legislators", ["bioguide_id"], name: "index_legislators_on_bioguide_id", using: :btree

  create_table "politicians", force: :cascade do |t|
    t.string   "name",                         null: false
    t.string   "political_party",              null: false
    t.string   "title",                        null: false
    t.string   "twitter_handle",               null: false
    t.string   "twitter_profile",              null: false
    t.string   "slug",                         null: false
    t.string   "tweets",          default: [],              array: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "image"
  end

  create_table "positions", force: :cascade do |t|
    t.integer  "vote_id",       null: false
    t.string   "bioguide_id",   null: false
    t.string   "vote_position", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "positions", ["bioguide_id"], name: "index_positions_on_bioguide_id", using: :btree
  add_index "positions", ["vote_position"], name: "index_positions_on_vote_position", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "subjects", ["category_id"], name: "index_subjects_on_category_id", using: :btree
  add_index "subjects", ["name"], name: "index_subjects_on_name", using: :btree

  create_table "votes", force: :cascade do |t|
    t.string   "chamber",                null: false
    t.string   "congress",               null: false
    t.string   "session",                null: false
    t.string   "roll_call",              null: false
    t.string   "official_bill_id",       null: false
    t.string   "democratic_yes"
    t.string   "democratic_no"
    t.string   "democratic_present"
    t.string   "democratic_not_voting"
    t.string   "republican_yes"
    t.string   "republican_no"
    t.string   "republican_present"
    t.string   "republican_not_voting"
    t.string   "independent_yes"
    t.string   "independent_no"
    t.string   "independent_present"
    t.string   "independent_not_voting"
    t.string   "total_yes"
    t.string   "total_no"
    t.string   "total_present"
    t.string   "total_not_voting"
    t.integer  "bill_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
