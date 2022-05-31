#!/bin/bash
set -e

if [ $RAILS_ENV = "production" ]; then
  bundle install --without development test
  bundle exec rails assets:precompile
  bundle exec rails db:migrate
else
  bundle install
fi

if [ -f /webapp/tmp/pids/server.pid ]; then
  rm -f /webapp/tmp/pids/server.pid
fi

bundle install
bundle exec rails s -p 3000 -b '0.0.0.0'

exec "$@"
