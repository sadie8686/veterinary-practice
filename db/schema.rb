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

ActiveRecord::Schema.define(version: 20140212102659) do

  create_table "appointments", force: true do |t|
    t.integer  "doctor_id"
    t.date     "date_of_visit",           null: false
    t.string   "pet"
    t.string   "customer"
    t.boolean  "reminder_of_appointment"
    t.text     "reason_for_visit"
    t.integer  "receptionist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "information", force: true do |t|
    t.integer  "appointment_id"
    t.string   "name_of_pet"
    t.string   "type_of_pet"
    t.string   "breed"
    t.integer  "age"
    t.float    "weight"
    t.date     "date_of_last_visit"
    t.integer  "doctor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "information", ["appointment_id"], name: "index_information_on_appointment_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                                  default: "", null: false
    t.string   "name",                        limit: 35,              null: false
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "school_received_degree_form"
    t.integer  "years_in_practice"
    t.string   "encrypted_password",                     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
