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

ActiveRecord::Schema.define(version: 20160626220530) do

  create_table "aplicacoes", force: :cascade do |t|
    t.integer  "projeto_id",     limit: 4
    t.integer  "checklist_id",   limit: 4
    t.datetime "data_aplicacao"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.date     "prazo"
  end

  add_index "aplicacoes", ["checklist_id"], name: "index_aplicacoes_on_checklist_id", using: :btree
  add_index "aplicacoes", ["projeto_id"], name: "index_aplicacoes_on_projeto_id", using: :btree

  create_table "checklists", force: :cascade do |t|
    t.string   "identificacao", limit: 255
    t.string   "fase",          limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "itens", force: :cascade do |t|
    t.text     "descricao",    limit: 65535
    t.boolean  "produto"
    t.boolean  "processo"
    t.integer  "checklist_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "ordem",        limit: 4
  end

  add_index "itens", ["checklist_id"], name: "index_itens_on_checklist_id", using: :btree

  create_table "nao_confomidades", force: :cascade do |t|
    t.integer  "checklist_id", limit: 4
    t.integer  "item_id",      limit: 4
    t.text     "dewcricao",    limit: 65535
    t.text     "origem",       limit: 65535
    t.integer  "prazo",        limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "nao_confomidades", ["checklist_id"], name: "index_nao_confomidades_on_checklist_id", using: :btree
  add_index "nao_confomidades", ["item_id"], name: "index_nao_confomidades_on_item_id", using: :btree

  create_table "nao_conformidades", force: :cascade do |t|
    t.integer  "checklist_id", limit: 4
    t.integer  "item_id",      limit: 4
    t.text     "descricao",    limit: 65535
    t.text     "origem",       limit: 65535
    t.integer  "prazo",        limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "nao_conformidades", ["checklist_id"], name: "index_nao_conformidades_on_checklist_id", using: :btree
  add_index "nao_conformidades", ["item_id"], name: "index_nao_conformidades_on_item_id", using: :btree

  create_table "projetos", force: :cascade do |t|
    t.string   "nome",        limit: 255
    t.string   "desc",        limit: 255
    t.string   "responsavel", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",   null: false
    t.string   "encrypted_password",     limit: 255, default: "",   null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "papel",                  limit: 255
    t.boolean  "admin",                              default: true, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "nao_confomidades", "checklists"
  add_foreign_key "nao_confomidades", "itens"
  add_foreign_key "nao_conformidades", "checklists"
  add_foreign_key "nao_conformidades", "itens"
end
