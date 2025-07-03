#!/bin/bash
set -e

export RAILS_ENV=production
export RACK_ENV=production

echo "==> Executando migrations..."
bundle exec rails db:migrate

echo "==> Executando seeds..."
bundle exec rails db:seed

echo "==> Iniciando o servidor..."
exec bundle exec rails server -b 0.0.0.0
