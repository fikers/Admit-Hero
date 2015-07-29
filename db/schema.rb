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

ActiveRecord::Schema.define(version: 20150728204930) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "articles", ["title"], name: "index_articles_on_title", unique: true

  create_table "basic_infos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "basic_infos", ["user_id"], name: "index_basic_infos_on_user_id"

  create_table "tag_article_relationships", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tag_article_relationships", ["article_id"], name: "index_tag_article_relationships_on_article_id"
  add_index "tag_article_relationships", ["tag_id", "article_id"], name: "index_tag_article_relationships_on_tag_id_and_article_id", unique: true
  add_index "tag_article_relationships", ["tag_id"], name: "index_tag_article_relationships_on_tag_id"

  create_table "tag_libs", force: :cascade do |t|
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "summer_programs",   default: false
    t.boolean  "scholarships",      default: false
    t.boolean  "stem",              default: false
    t.boolean  "humanities",        default: false
    t.boolean  "computer_science",  default: false
    t.boolean  "traveling",         default: false
    t.boolean  "community_service", default: false
    t.boolean  "research",          default: false
    t.boolean  "internships",       default: false
    t.boolean  "arts",              default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "tags", ["user_id"], name: "index_tags_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",                  default: false
    t.string   "activation_digest"
    t.boolean  "activated",              default: false
    t.datetime "activated_at"
    t.string   "password_reset_digest"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
