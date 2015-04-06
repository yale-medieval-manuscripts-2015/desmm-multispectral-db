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

ActiveRecord::Schema.define(version: 20150406194350) do

  create_table "multi_spectral_profiles", force: :cascade do |t|
    t.integer  "profileId"
    t.integer  "NumBands"
    t.string   "BandRanges"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "multispec_uploads", force: :cascade do |t|
    t.string   "file_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "multispecs", force: :cascade do |t|
    t.string   "file_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "multispectral_barcharts", force: :cascade do |t|
    t.string   "barchart_png_filename"
    t.binary   "barchart_png_image"
    t.string   "upload_status"
    t.integer  "multispectral_sample_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "multispectral_barcharts", ["multispectral_sample_id"], name: "index_multispectral_barcharts_on_multispectral_sample_id"

  create_table "multispectral_samples", force: :cascade do |t|
    t.string   "multispectral_sample_semantic_id"
    t.string   "manifest"
    t.string   "canvas"
    t.integer  "x"
    t.integer  "y"
    t.string   "wavelength"
    t.string   "reflectance"
    t.boolean  "normalized"
    t.string   "creating_application"
    t.string   "creating_application_version"
    t.text     "comment"
    t.string   "exr_file_name"
    t.string   "user"
    t.integer  "profile_id"
    t.string   "upload_status"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "multispectral_tags", force: :cascade do |t|
    t.string   "hash_tag"
    t.string   "facet_category"
    t.string   "facet_value"
    t.string   "upload_status"
    t.integer  "multispectral_sample_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "multispectral_tags", ["multispectral_sample_id"], name: "index_multispectral_tags_on_multispectral_sample_id"

  create_table "multispectral_values", force: :cascade do |t|
    t.integer  "range"
    t.float    "value"
    t.string   "upload_status"
    t.integer  "multispectral_sample_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "multispectral_values", ["multispectral_sample_id"], name: "index_multispectral_values_on_multispectral_sample_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
