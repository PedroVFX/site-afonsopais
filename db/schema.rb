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

ActiveRecord::Schema.define(version: 20150331234651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "participacaos", force: true do |t|
    t.string   "dialog"
    t.string   "titulo"
    t.string   "imagem"
    t.text     "texto"
    t.text     "nota"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url_code_share"
    t.string   "soundcloud_item"
  end

  create_table "soundcloud_items", force: true do |t|
    t.string   "item"
    t.string   "nome"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url_share"
  end

  create_table "texto_lancamentos", force: true do |t|
    t.string   "nome"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "vimeo_items", force: true do |t|
    t.string   "item"
    t.string   "nome"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code_share"
  end

  create_table "youtube_items", force: true do |t|
    t.string   "item"
    t.string   "nome"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
