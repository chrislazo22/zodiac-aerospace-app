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

ActiveRecord::Schema.define(version: 20170719163902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "specimen", force: :cascade do |t|
    t.string   "pass_or_fail"
    t.string   "test_plan"
    t.string   "cushion"
    t.string   "test_plan_id"
    t.integer  "seat_model"
    t.date     "test_date"
    t.decimal  "vert_burn_length_front"
    t.decimal  "vert_burn_length_back"
    t.decimal  "horiz_burn_length_top"
    t.decimal  "horiz_burn_length_bottom"
    t.decimal  "weight_loss_lbs"
    t.decimal  "weight_loss_percent"
    t.string   "cover_config"
    t.string   "foam_a_material"
    t.decimal  "foam_a_percent"
    t.string   "foam_b_material"
    t.decimal  "foam_b_percent"
    t.string   "foam_c_material"
    t.decimal  "foam_c_percent"
    t.string   "foam_d_material"
    t.decimal  "foam_d_percent"
    t.string   "foam_e_material"
    t.decimal  "foam_e_percent"
    t.string   "decorative_insulation_part_number"
    t.string   "decorative_insulation_mfr"
    t.string   "backing"
    t.string   "adhesive_one"
    t.string   "adhesive_two"
    t.string   "fireblock_type"
    t.string   "fireblock_part_number"
    t.string   "fireblock_color"
    t.string   "fireblock_mfr"
    t.string   "flame_treatment"
    t.decimal  "fireblock_percent"
    t.string   "thermoplastic_part_number"
    t.string   "thermoplastic_mfr"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "type"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
