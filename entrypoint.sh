#!/bin/bash
set -e

# Executa as migrations e seeds após iniciar o container
echo "==> Executando migrations..."
bundle exec rails db:migrate

echo "==> Executando seeds..."
bundle exec rails db:seed

echo "==> Iniciando o servidor..."
exec "$@"
