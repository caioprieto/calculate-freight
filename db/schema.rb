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

ActiveRecord::Schema[8.0].define(version: 2025_05_08_035744) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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

  create_table "aulas", force: :cascade do |t|
    t.integer "modulo_id", null: false
    t.string "titulo", null: false
    t.string "description"
    t.integer "duration"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modulo_id"], name: "index_aulas_on_modulo_id"
  end

  create_table "cursos", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "subdescription"
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prova"
    t.string "tipo"
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

  create_table "modulos", force: :cascade do |t|
    t.integer "curso_id", null: false
    t.string "titulo", null: false
    t.string "description"
    t.integer "position"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_modulos_on_curso_id"
  end

  create_table "texts", force: :cascade do |t|
    t.integer "word_id", null: false
    t.text "content"
    t.index ["word_id"], name: "index_texts_on_word_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome", null: false
    t.string "sobrenome", null: false
    t.integer "cpf", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.integer "duration", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", force: :cascade do |t|
    t.string "word_type", null: false
    t.text "tema", null: false
    t.text "introducao"
    t.text "proposta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "aulas", "modulos"
  add_foreign_key "freights", "address", column: "address_destino_id"
  add_foreign_key "freights", "address", column: "address_origem_id"
  add_foreign_key "modulos", "cursos"
  add_foreign_key "texts", "words"
end
