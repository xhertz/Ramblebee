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

ActiveRecord::Schema.define(:version => 20110601002348) do

  create_table "installs", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "installs", ["email"], :name => "index_installs_on_email", :unique => true
  add_index "installs", ["reset_password_token"], :name => "index_installs_on_reset_password_token", :unique => true

  create_table "point_tours", :force => true do |t|
    t.integer  "point_id"
    t.integer  "tour_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "points", :force => true do |t|
    t.string   "name"
    t.string   "localeName"
    t.string   "shortDescription"
    t.text     "longDescription"
    t.string   "tag"
    t.string   "language"
    t.string   "category"
    t.integer  "timeRequiredForResource"
    t.integer  "timeSuggestedToSpend"
    t.string   "bestTime"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "altitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completed",               :default => false
    t.boolean  "gmaps"
  end

  create_table "tours", :force => true do |t|
    t.string   "name"
    t.string   "localeName"
    t.string   "shortDescription"
    t.text     "longDescription"
    t.string   "tag"
    t.string   "language"
    t.string   "category"
    t.string   "type"
    t.integer  "distances"
    t.string   "ageGroup"
    t.integer  "timeRequired"
    t.string   "city"
    t.string   "country"
    t.string   "bestTime"
    t.float    "price"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
