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

ActiveRecord::Schema.define(version: 20151005201541) do

  create_table "canvas_lookups", force: :cascade do |t|
    t.string   "canvas_id"
    t.string   "object_file_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "canvas_lookups", ["canvas_id"], name: "index_canvas_lookups_on_canvas_id"
  add_index "canvas_lookups", ["object_file_id"], name: "index_canvas_lookups_on_object_file_id"

  create_table "commontator_comments", force: :cascade do |t|
    t.string   "creator_type"
    t.integer  "creator_id"
    t.string   "editor_type"
    t.integer  "editor_id"
    t.integer  "thread_id",                     null: false
    t.text     "body",                          null: false
    t.datetime "deleted_at"
    t.integer  "cached_votes_up",   default: 0
    t.integer  "cached_votes_down", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commontator_comments", ["cached_votes_down"], name: "index_commontator_comments_on_cached_votes_down"
  add_index "commontator_comments", ["cached_votes_up"], name: "index_commontator_comments_on_cached_votes_up"
  add_index "commontator_comments", ["creator_id", "creator_type", "thread_id"], name: "index_commontator_comments_on_c_id_and_c_type_and_t_id"
  add_index "commontator_comments", ["thread_id", "created_at"], name: "index_commontator_comments_on_thread_id_and_created_at"

  create_table "commontator_subscriptions", force: :cascade do |t|
    t.string   "subscriber_type", null: false
    t.integer  "subscriber_id",   null: false
    t.integer  "thread_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commontator_subscriptions", ["subscriber_id", "subscriber_type", "thread_id"], name: "index_commontator_subscriptions_on_s_id_and_s_type_and_t_id", unique: true
  add_index "commontator_subscriptions", ["thread_id"], name: "index_commontator_subscriptions_on_thread_id"

  create_table "commontator_threads", force: :cascade do |t|
    t.string   "commontable_type"
    t.integer  "commontable_id"
    t.datetime "closed_at"
    t.string   "closer_type"
    t.integer  "closer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commontator_threads", ["commontable_id", "commontable_type"], name: "index_commontator_threads_on_c_id_and_c_type", unique: true

  create_table "multispectral_barcharts", force: :cascade do |t|
    t.string   "barchart_png_filename"
    t.binary   "barchart_png_image"
    t.string   "upload_status"
    t.integer  "multispectral_sample_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "multispectral_barcharts", ["multispectral_sample_id"], name: "index_multispectral_barcharts_on_multispectral_sample_id"

  create_table "multispectral_profiles", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "num_bands"
    t.string   "band_ranges"
    t.string   "creating_application"
    t.string   "creating_application_version"
    t.text     "notes"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

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
    t.string   "manifest_label"
    t.string   "canvas_label"
    t.string   "institution"
    t.string   "md_date"
    t.string   "md_provenance"
    t.string   "md_material"
    t.string   "md_language"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "batch_id"
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

  create_table "tests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uploads", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

end
