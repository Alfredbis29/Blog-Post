# Deployment Instructions for Render

## Required Environment Variables

Set these environment variables in your Render dashboard:

1. **SECRET_KEY_BASE** - Generate with: `rails secret`
   - Example value: `d4821b5afab1d79291afdcdb09489134840eedb350a398b1f4c4eeea51cd1d90098811e0d4b5f07be2c02b7535e40c6d7be642448fbc472735f92eb3e09170af`
   - **IMPORTANT**: Generate a new secret key for production, don't use this example!

2. **RAILS_ENV** - Set to: `production`

3. **RAILS_SERVE_STATIC_FILES** - Set to: `true` (optional, already configured)

4. **RAILS_LOG_TO_STDOUT** - Set to: `true` (optional, for better logging)

## Steps to Deploy

1. Generate a secret key:
   ```bash
   rails secret
   ```

2. In Render dashboard, go to your service → Environment
3. Add the environment variables listed above
4. Deploy your application

## Build Command

Render will automatically detect the Procfile and use:
- `web: bundle exec rails server -p $PORT -e production`
- `release: bundle exec rails db:migrate`

## Database

The app uses SQLite by default. For production, consider using PostgreSQL:
- Add `pg` gem to Gemfile
- Update `config/database.yml` for production
- Add PostgreSQL database in Render

