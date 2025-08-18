FROM ruby:3.2

ARG RAILS_ENV=production
ARG SKIP_ENTRYPOINT=false

ENV RAILS_ENV=production
ENV RACK_ENV=production

# Pacotes essenciais + NodeJS
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  postgresql-client \
  git \
  curl \
  gnupg2 \
  dirmngr

# Instala Yarn via repositório oficial
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/yarn.gpg \
  && echo "deb [signed-by=/usr/share/keyrings/yarn.gpg] https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update && apt-get install -y yarn

WORKDIR /app

COPY Gemfile Gemfile.lock ./

# Configura bundle para produção
RUN if [ "$RAILS_ENV" = "production" ]; then \
      bundle config set deployment 'true' && \
      bundle config set without 'development test'; \
    fi && \
    bundle install

COPY . .

# Copia o entrypoint e torna executável
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
