ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION-slim-buster

# ARG PG_MAJOR # FIXME: commented for now while we are not using any database
ARG BUNDLER_VERSION

# Common dependencies
RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
  build-essential \
  gnupg2 \
  curl \
  less \
  git \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

# FIXME: commented for now while we are not using any database
# # Add PostgreSQL to sources list
# RUN curl -sSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
#   && echo 'deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main' $PG_MAJOR > /etc/apt/sources.list.d/pgdg.list

# Install dependencies
COPY ./Aptfile /tmp/Aptfile
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
  # FIXME: commented for now while we are not using any database
  # libpq-dev \
  # postgresql-client-$PG_MAJOR \
  $(cat /tmp/Aptfile | xargs) && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  truncate -s 0 /var/log/*log

# Configure bundler
ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

# Uncomment this line if you store Bundler settings in the project's root
# ENV BUNDLE_APP_CONFIG=.bundle

# Uncomment this line if you want to run binstubs without prefixing with `bin/` or `bundle exec`
# ENV PATH /app/bin:$PATH

# Upgrade RubyGems and install required Bundler version
# See https://github.com/evilmartians/terraforming-rails/pull/24 for discussion
RUN gem update --system && \
  rm /usr/local/lib/ruby/gems/*/specifications/default/bundler-*.gemspec && \
  gem uninstall bundler && \
  gem install bundler -v $BUNDLER_VERSION

# Create a directory for the app code
RUN mkdir -p /app

WORKDIR /app
