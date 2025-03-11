ActiveRecord::Schema[8.0].define(version: 2025_03_10_190522) do
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
  end
end
