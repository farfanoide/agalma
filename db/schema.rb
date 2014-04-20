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

ActiveRecord::Schema.define(version: 20140420205827) do

  create_table "branches", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.string   "email"
    t.integer  "zipcode"
    t.string   "zone"
    t.boolean  "external",    default: false
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "external_branches", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.string   "email"
    t.integer  "zipcode"
    t.string   "zone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "external_telephones", force: true do |t|
    t.integer  "ext"
    t.integer  "num"
    t.integer  "external_branch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "external_telephones", ["external_branch_id"], name: "index_external_telephones_on_external_branch_id", using: :btree

  create_table "galeries", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
  end

  create_table "image_sliders", force: true do |t|
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.string   "file_name"
    t.string   "name"
    t.integer  "galery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["galery_id"], name: "index_images_on_galery_id", using: :btree

  create_table "mailers", force: true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "sender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mailers", ["sender_id"], name: "index_mailers_on_sender_id", using: :btree

  create_table "mails_users", id: false, force: true do |t|
    t.integer "mail_id", null: false
    t.integer "user_id", null: false
  end

  create_table "menus", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "branch_id"
    t.string   "position"
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "body"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.integer  "menu_id"
    t.integer  "branch_id"
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", using: :btree

  create_table "pages_widgets", id: false, force: true do |t|
    t.integer "page_id",   null: false
    t.integer "widget_id", null: false
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.text     "content"
    t.integer  "branch_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["branch_id"], name: "index_posts_on_branch_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rolifications", force: true do |t|
    t.integer  "branch_id"
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rolifications", ["branch_id"], name: "index_rolifications_on_branch_id", using: :btree
  add_index "rolifications", ["role_id"], name: "index_rolifications_on_role_id", using: :btree
  add_index "rolifications", ["user_id"], name: "index_rolifications_on_user_id", using: :btree

  create_table "telephones", force: true do |t|
    t.integer  "ext"
    t.integer  "num"
    t.integer  "branch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "telephones", ["branch_id"], name: "index_telephones_on_branch_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "avatar"
    t.boolean  "admin",                  default: false
    t.integer  "active_branch"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "widgets", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "cell_class"
    t.string   "method_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
