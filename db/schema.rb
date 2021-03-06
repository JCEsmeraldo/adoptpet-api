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

ActiveRecord::Schema.define(version: 2019_05_24_231739) do

  create_table "pedidos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "pet_id"
    t.bigint "usuario_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_pedidos_on_pet_id"
    t.index ["usuario_id"], name: "index_pedidos_on_usuario_id"
  end

  create_table "pets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.date "data_nasc"
    t.string "genero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "especie"
    t.string "descricao"
    t.string "porte"
    t.binary "foto", limit: 4294967295
    t.bigint "usuario_id"
    t.boolean "adotado"
    t.index ["usuario_id"], name: "index_pets_on_usuario_id"
  end

  create_table "tipos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "senha"
    t.string "rua"
    t.string "cpf_cnpj"
    t.string "bairro"
    t.string "cidade"
    t.string "estado"
    t.string "pais"
    t.string "numero"
    t.string "complemento"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pedidos", "pets"
  add_foreign_key "pedidos", "usuarios"
  add_foreign_key "pets", "usuarios"
end
