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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130217062004) do

  create_table "mvs_auctions", :force => true do |t|
    t.integer  "mvs_game_id"
    t.integer  "item_id"
    t.string   "title"
    t.string   "url"
    t.string   "small"
    t.string   "medium"
    t.string   "large"
    t.datetime "auction_end"
    t.datetime "ended_at"
    t.decimal  "price"
    t.boolean  "approved",    :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "mvs_auctions", ["mvs_game_id", "item_id"], :name => "index_mvs_auctions_on_mvs_game_id_and_item_id"

  create_table "mvs_games", :force => true do |t|
    t.integer  "year"
    t.integer  "ngh"
    t.string   "developer"
    t.string   "series"
    t.string   "title_english"
    t.string   "title_romaji"
    t.string   "title_katakana"
    t.integer  "meg"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
