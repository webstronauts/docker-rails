FROM ruby:2.5

# Set the exposed port as environment variable.
ENV PORT 4000

# Expose our configured port.
EXPOSE 4000

# Log to stdout when running on production.
ENV RAILS_LOG_TO_STDOUT true

# Install some required packages.
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential postgresql-client nodejs && \
    rm -rf /var/lib/apt/lists/*

# Make sure Bundler is the latest version and foreman exists.
RUN gem install bundler foreman

# Create the directory where the project's files will be copied to.
RUN mkdir /app
WORKDIR /app

# Copy Gemfile and Gemfile.lock from the project.
ONBUILD COPY Gemfile* /app/

# Only install gems required for production.
ONBUILD RUN bundle install --frozen --without development test

# Copy the rest of the project's files.
ONBUILD COPY . /app
