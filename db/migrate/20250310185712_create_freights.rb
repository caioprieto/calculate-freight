class CreateFreights < ActiveRecord::Migration[8.0]
  def change
    create_table :freights do |t|
      t.integer :cep
      t.string :nome_do_serviço
      t.string :compania
      t.string :moeda

      t.datetime :tempo_minimo
      t.datetime :tempo_maximo
      t.datetime :tempo_estimado

      t.decimal :preço_inicial
      t.decimal :desconto
      t.decimal :preço_final

      t.timestamps
    end
  end
end
