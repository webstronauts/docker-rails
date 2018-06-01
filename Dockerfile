FROM ruby:2.5

# Set the exposed port as environment variable.
ENV PORT 4000

# Log to stdout when running on production.
ENV RAILS_LOG_TO_STDOUT true

# Install some required packages.
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential postgresql-client nodejs && \
    rm -rf /var/lib/apt/lists/*

# Make sure Bundler is the latest version.
RUN gem install bundler

# Make sure foreman exists.
RUN gem install foreman

RUN mkdir /app
WORKDIR /app

COPY Gemfile* /app/

# Only install gems required for production.
RUN bundle install --frozen --without development test

COPY . /app

# Expose our configured port.
EXPOSE 4000
