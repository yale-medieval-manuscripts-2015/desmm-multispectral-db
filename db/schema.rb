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

ActiveRecord::Schema.define(version: 20150325023621) do

  create_table "activities", force: :cascade do |t|
    t.string   "MultiSpecSample_id"
    t.string   "Status"
    t.datetime "UploadedOn"
    t.string   "UploadedBy"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "multi_spec_bar_charts", force: :cascade do |t|
    t.string   "multi_spec_sample_id"
    t.string   "barchart_png_filename"
    t.string   "bar"
    t.binary   "chart_png_image"
    t.string   "upload_status"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "multi_spec_samples", force: :cascade do |t|
    t.string   "multi_spec_sample_id"
    t.string   "manifest"
    t.string   "canvas"
    t.integer  "x"
    t.integer  "y"
    t.string   "creatingApplication"
    t.text     "comment"
    t.string   "exrFileName"
    t.string   "user"
    t.integer  "profileID"
    t.string   "upload_status"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "multi_spec_tags", force: :cascade do |t|
    t.string   "multi_spec_sample_id"
    t.string   "Tag"
    t.string   "TagValue"
    t.string   "upload_status"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "multi_spec_values", force: :cascade do |t|
    t.string   "multi_spec_sample_id"
    t.string   "wavelength"
    t.integer  "range"
    t.float    "value"
    t.integer  "reflectance"
    t.boolean  "normalized"
    t.string   "upload_status"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

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

end
