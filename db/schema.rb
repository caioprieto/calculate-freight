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

ActiveRecord::Schema[8.0].define(version: 2025_07_02_193844) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

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

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "aulas", force: :cascade do |t|
    t.integer "modulo_id", null: false
    t.string "titulo", null: false
    t.string "description"
    t.integer "duration"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "word_id"
    t.index ["modulo_id"], name: "index_aulas_on_modulo_id"
    t.index ["word_id"], name: "index_aulas_on_word_id"
  end

  create_table "cart_cursos", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "curso_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_cursos_on_cart_id"
    t.index ["curso_id"], name: "index_cart_cursos_on_curso_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "status", default: "pending", null: false
    t.decimal "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "user_word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_word_id"], name: "index_chats_on_user_word_id"
  end

  create_table "curso_words", force: :cascade do |t|
    t.integer "curso_id", null: false
    t.integer "word_id", null: false
    t.index ["curso_id"], name: "index_curso_words_on_curso_id"
    t.index ["word_id"], name: "index_curso_words_on_word_id"
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
    t.decimal "value"
    t.integer "duration"
    t.decimal "value_riscado"
    t.integer "vigencia", default: 6, null: false
  end

  create_table "cursos_words", id: false, force: :cascade do |t|
    t.integer "curso_id", null: false
    t.integer "word_id", null: false
    t.index ["curso_id"], name: "index_cursos_words_on_curso_id"
    t.index ["word_id"], name: "index_cursos_words_on_word_id"
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

  create_table "messages", force: :cascade do |t|
    t.bigint "chat_id"
    t.string "dono_type"
    t.bigint "dono_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["dono_type", "dono_id"], name: "index_messages_on_dono"
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

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "body"
    t.boolean "read", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "notification_type", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "user_id", null: false
    t.string "status", default: "pending", null: false
    t.integer "cursos_count"
    t.decimal "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.integer "cursos_ids", default: [], null: false, array: true
    t.index ["cart_id"], name: "index_pedidos_on_cart_id"
    t.index ["user_id"], name: "index_pedidos_on_user_id"
  end

  create_table "temas", force: :cascade do |t|
    t.string "name", null: false
    t.string "prova", default: "enem", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "texts", force: :cascade do |t|
    t.integer "word_id", null: false
    t.text "content"
    t.index ["word_id"], name: "index_texts_on_word_id"
  end

  create_table "user_aulas", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "aula_id", null: false
    t.boolean "watched", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "curso_id", null: false
    t.index ["aula_id"], name: "index_user_aulas_on_aula_id"
    t.index ["curso_id"], name: "index_user_aulas_on_curso_id"
    t.index ["user_id"], name: "index_user_aulas_on_user_id"
  end

  create_table "user_cursos", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "curso_id", null: false
    t.integer "progresso", default: 0, null: false
    t.boolean "concluido", default: false, null: false
    t.datetime "data_inicio"
    t.integer "total_aulas", default: 0
    t.integer "total_aulas_vistas", default: 0
    t.datetime "data_fim"
    t.boolean "ativo", default: true
    t.index ["curso_id"], name: "index_user_cursos_on_curso_id"
    t.index ["user_id", "curso_id"], name: "index_user_cursos_on_user_id_and_curso_id", unique: true
    t.index ["user_id"], name: "index_user_cursos_on_user_id"
  end

  create_table "user_words", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "word_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "concluido", default: false
    t.datetime "data_conclusao"
    t.bigint "curso_id"
    t.index ["curso_id"], name: "index_user_words_on_curso_id"
    t.index ["user_id"], name: "index_user_words_on_user_id"
    t.index ["word_id"], name: "index_user_words_on_word_id"
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
    t.string "cpf", null: false
    t.boolean "active", default: true, null: false
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
  add_foreign_key "aulas", "words"
  add_foreign_key "cart_cursos", "carts"
  add_foreign_key "cart_cursos", "cursos"
  add_foreign_key "carts", "users"
  add_foreign_key "chats", "user_words"
  add_foreign_key "curso_words", "cursos"
  add_foreign_key "curso_words", "words"
  add_foreign_key "freights", "address", column: "address_destino_id"
  add_foreign_key "freights", "address", column: "address_origem_id"
  add_foreign_key "messages", "chats"
  add_foreign_key "modulos", "cursos"
  add_foreign_key "notifications", "users"
  add_foreign_key "pedidos", "carts"
  add_foreign_key "pedidos", "users"
  add_foreign_key "texts", "words"
  add_foreign_key "user_aulas", "aulas"
  add_foreign_key "user_aulas", "cursos"
  add_foreign_key "user_aulas", "users"
  add_foreign_key "user_cursos", "cursos"
  add_foreign_key "user_cursos", "users"
  add_foreign_key "user_words", "cursos"
  add_foreign_key "user_words", "users"
  add_foreign_key "user_words", "words"
end
