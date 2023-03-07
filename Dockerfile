FROM ruby:3.2.1-alpine3.16

ENV LANG="C.UTF-8" \
    RAILS_LOG_TO_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="0"

ARG RELEASE_NO
ENV RELEASE_NO=${RELEASE_NO}

WORKDIR /usr/src/app

RUN set -ex && \
  apk add --no-cache --virtual build-dependencies build-base && \
  apk add --no-cache \
    alpine-sdk \
    git \
    less \
    mariadb-dev \
    tzdata && \
  gem install bundler:2.2.25

COPY Gemfile* ./

RUN set -ex && \
  bundle install --jobs=4 --retry 4 && \
  apk del --purge build-dependencies

COPY . ./

EXPOSE 3000
CMD ["rails", "server"]