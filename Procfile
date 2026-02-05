web: bundle exec rails db:create db:migrate 2>&1 || true; bundle exec rails server -p ${PORT:-3000} -e production
release: bundle exec rails db:create db:migrate || true
