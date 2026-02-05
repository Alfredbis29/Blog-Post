web: bundle exec rails server -p ${PORT:-3000} -e production
release: bundle exec rails db:prepare || bundle exec rails db:create db:migrate
