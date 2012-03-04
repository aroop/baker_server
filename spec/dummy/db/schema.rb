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

ActiveRecord::Schema.define(:version => 20120304020934) do

  create_table "baker_server_issues", :force => true do |t|
    t.date     "published_date"
    t.date     "end_date"
    t.string   "issue_id"
    t.text     "summary"
    t.string   "cover_art_uid"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "baker_server_products", :force => true do |t|
    t.string   "product_id"
    t.string   "content_uid"
    t.string   "name"
    t.string   "icon_uid"
    t.string   "preview_uid"
    t.string   "type"
    t.text     "description"
    t.boolean  "paid"
    t.integer  "subscription_id"
    t.integer  "subscription_duration_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "baker_server_subscription_durations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "baker_server_subscriptions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "expiration_message"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
