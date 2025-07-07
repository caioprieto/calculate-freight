#!/bin/bash
set -e

export RAILS_ENV=production
export RACK_ENV=production

if [ ! -d "public/assets" ] || [ -z "$(ls -A public/assets)" ]; then
  echo "==> Compilando assets..."
  bundle exec rake assets:precompile
fi

echo "==> Executando migrations..."
bundle exec rails db:migrate

echo "==> Executando seeds..."
bundle exec rails db:seed

echo "==> Iniciando o servidor..."
exec bundle exec rails server -b 0.0.0.0
