FROM ruby:3.2

ARG RAILS_ENV=production
ARG SKIP_ENTRYPOINT=false

ENV RAILS_ENV=production
ENV RACK_ENV=production

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

# Configura bundle para produção apenas se for o ambiente
RUN if [ "$RAILS_ENV" = "production" ]; then \
      bundle config set deployment 'true' && \
      bundle config set without 'development test'; \
    fi && \
    bundle install

COPY . .

# Copia o entrypoint e torna executável sempre
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
