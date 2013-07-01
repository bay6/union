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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20130630145907) do
=======
ActiveRecord::Schema.define(:version => 20130701013644) do
>>>>>>> 99b923004c64f8b071d3f2bd5e3f960a39051f0b

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "grades", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "weights"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "participations", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "role"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "participations", ["project_id"], :name => "index_participations_on_project_id"
  add_index "participations", ["user_id"], :name => "index_participations_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.text     "description"
    t.integer  "grade_id"
    t.integer  "user_id"
    t.date     "started_at"
    t.date     "finished_at"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "projects", ["grade_id"], :name => "index_projects_on_grade_id"
  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "records", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "category"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "value",      :default => 0
  end

  add_index "records", ["project_id"], :name => "index_records_on_project_id"
  add_index "records", ["user_id"], :name => "index_records_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.boolean  "admin",                  :default => false
    t.integer  "score",                  :default => 0
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
