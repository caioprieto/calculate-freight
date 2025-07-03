FROM ruby:3.2

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

RUN bundle config set deployment 'true' && \
    bundle config set without 'development test' && \
    bundle install

COPY . .

# Copia o entrypoint e dá permissão
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV RAILS_ENV=production
ENV RACK_ENV=production

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
