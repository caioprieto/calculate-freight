class CreateDelayedJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :delayed_jobs do |t|
      t.integer  :priority, default: 0, null: false # Jobs com menor prioridade serão processados primeiro
      t.integer  :attempts, default: 0, null: false # Número de tentativas do job
      t.text     :handler, null: false # Dados do job serializados
      t.text     :last_error # Armazena o erro da última tentativa
      t.datetime :run_at # Quando o job deve ser executado
      t.datetime :locked_at # Quando o job foi bloqueado para execução
      t.datetime :failed_at # Quando o job falhou
      t.string   :locked_by # Qual processo pegou o job
      t.string   :queue # Nome da fila
      t.timestamps
    end

    add_index :delayed_jobs, [:priority, :run_at], name: "delayed_jobs_priority"
  end
end
