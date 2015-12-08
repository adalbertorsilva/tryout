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

ActiveRecord::Schema.define(version: 20151207191311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidatos", force: :cascade do |t|
    t.string   "nome"
    t.integer  "idade"
    t.decimal  "peso"
    t.decimal  "altura"
    t.string   "camisa"
    t.string   "contato_emergencia"
    t.string   "email"
    t.decimal  "telefone",                    precision: 11
    t.decimal  "telefone_contato_emergencia", precision: 11
    t.boolean  "pagamento_efetuado"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "fotografia_file_name"
    t.string   "fotografia_content_type"
    t.integer  "fotografia_file_size"
    t.datetime "fotografia_updated_at"
  end

end
