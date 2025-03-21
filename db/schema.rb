# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_03_17_171218) do
  create_table "address", force: :cascade do |t|
    t.string "rua"
    t.string "bairro"
    t.string "cidade"
    t.string "estado"
    t.string "pais"
    t.integer "numero"
    t.integer "cep"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "freights", force: :cascade do |t|
    t.integer "cep"
    t.string "nome_do_serviço"
    t.string "compania"
    t.string "moeda"
    t.datetime "tempo_minimo"
    t.datetime "tempo_maximo"
    t.datetime "tempo_estimado"
    t.decimal "preço_inicial"
    t.decimal "desconto"
    t.decimal "preço_final"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "address_origem_id", null: false
    t.integer "address_destino_id", null: false
    t.index ["address_destino_id"], name: "index_freights_on_address_destino_id"
    t.index ["address_origem_id"], name: "index_freights_on_address_origem_id"
  end

  add_foreign_key "freights", "address", column: "address_destino_id"
  add_foreign_key "freights", "address", column: "address_origem_id"
end
