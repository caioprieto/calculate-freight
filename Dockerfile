FROM ruby:3.2

# Instalar dependências do sistema
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  postgresql-client

# Criar diretório da app
WORKDIR /app

# Copiar Gemfile e instalar gems
COPY Gemfile* ./
RUN bundle install

# Copiar todo o projeto
COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
