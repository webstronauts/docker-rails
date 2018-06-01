FROM ruby:2.5-alpine

# Set the exposed port as environment variable.
ENV PORT 4000

# Expose our configured port.
EXPOSE 4000

# Set the default Rails environment to production.
ENV RAILS_ENV production

# Log to stdout when running on production.
ENV RAILS_LOG_TO_STDOUT true

# Install some required build dependencies and packages.
RUN apk --no-cache --virtual build-dependencies add build-base \
    && apk --no-cache add nodejs postgresql-dev

# Make sure Bundler is the latest version and foreman exists.
RUN gem install bundler foreman

# Create the directory where the project's files will be copied to.
RUN mkdir /app
WORKDIR /app

# Copy Gemfile and Gemfile.lock from the project.
ONBUILD COPY Gemfile* /app/

# Only install gems required for production.
ONBUILD RUN bundle install --frozen --no-cache --without development test \
    && apk del build-dependencies

# Copy the rest of the project's files.
ONBUILD COPY . /app
