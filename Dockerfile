### #################################################################
FROM ruby:3.4.8-slim as dvg-visit-base

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

ENV RACK_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_WITHOUT="development test" \
    BUNDLE_JOBS="4" \
    MALLOC_ARENA_MAX="2"

COPY Gemfile Gemfile.lock* ./
RUN bundle config set --local without "${BUNDLE_WITHOUT}" && bundle install

### #################################################################
FROM dvg-visit-base AS dvg-visit-production

COPY . .
RUN bundle exec ruby bin/compile_assets --quiet

EXPOSE 3000

CMD ["bundle", "exec", "rackup", "config.ru", "--host", "0.0.0.0", "--port", "3000"]
