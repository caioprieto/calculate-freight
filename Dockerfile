FROM ruby:3.2

ARG RAILS_ENV=development

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  postgresql-client \
  git \
  curl

WORKDIR /app

COPY Gemfile Gemfile.lock ./

# Comando de bundle baseado no ambiente
RUN if [ "$RAILS_ENV" = "production" ]; then \
      bundle config set deployment 'true' && \
      bundle config set without 'development test'; \
    fi && \
    bundle install

COPY . .

# Só executa o entrypoint e exporta envs se for produção
ARG SKIP_ENTRYPOINT=false
RUN if [ "$RAILS_ENV" = "production" ] && [ "$SKIP_ENTRYPOINT" != "true" ]; then \
      cp entrypoint.sh /entrypoint.sh && \
      chmod +x /entrypoint.sh; \
    fi

EXPOSE 3000

# ENTRYPOINT também pode ser condicional, se quiser mais controle, mas aqui deixamos fixo:
# ENTRYPOINT ["/entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
