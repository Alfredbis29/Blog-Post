# Deployment Fix Guide

## ✅ Changes Made

1. **Procfile Updated**: Now uses `bin/release` script for database setup
2. **Release Script Created**: `bin/release` ensures db directory exists before migrations
3. **Production Config**: Fixed error handling settings

## 🚀 Deployment Steps for Each Platform

### Render.com

1. **Set Environment Variables** (in Render Dashboard → Your Service → Environment):
   ```
   SECRET_KEY_BASE=<generate with: rails secret>
   RAILS_ENV=production
   RAILS_SERVE_STATIC_FILES=true
   RAILS_LOG_TO_STDOUT=true
   ```

2. **Build Command** (should auto-detect from Procfile):
   - Build: `bundle install`
   - Start: `bundle exec rails server -p $PORT -e production`

3. **Migration Command** (in Render Dashboard → Your Service → Settings):
   - Set to: `bundle exec rails db:create db:migrate`
   - OR use the release command: `bin/release`

4. **If Still Failing**:
   - Go to Render Shell (in your service dashboard)
   - Run manually: `bundle exec rails db:create db:migrate`
   - Check logs for specific errors

### Railway.app

1. **Set Environment Variables**:
   ```
   SECRET_KEY_BASE=<generate with: rails secret>
   RAILS_ENV=production
   PORT=3000
   ```

2. **Railway auto-detects Procfile**, but you can set:
   - **Start Command**: `bundle exec rails server -p $PORT -e production`
   - **Migration Command**: `bin/release` or `bundle exec rails db:create db:migrate`

3. **If Still Failing**:
   - Open Railway CLI: `railway shell`
   - Run: `bundle exec rails db:create db:migrate`

### Fly.io

1. **Set Secrets**:
   ```bash
   fly secrets set SECRET_KEY_BASE=$(rails secret)
   fly secrets set RAILS_ENV=production
   ```

2. **Deploy**:
   ```bash
   fly deploy
   ```

3. **If Still Failing**:
   ```bash
   fly ssh console
   bundle exec rails db:create db:migrate
   ```

## 🔍 Common Issues & Solutions

### Issue: "Could not find table 'posts'"

**Solution**: Migrations didn't run. Do this:

1. **Check if migrations ran**: Look for migration logs in deployment output
2. **Run manually**: SSH into your deployment and run:
   ```bash
   bundle exec rails db:create db:migrate
   ```
3. **Verify database exists**: Check if `db/production.sqlite3` exists
4. **Check environment**: Ensure `RAILS_ENV=production` is set

### Issue: "Missing secret_key_base"

**Solution**: Set `SECRET_KEY_BASE` environment variable:
```bash
# Generate a secret key
rails secret

# Then set it in your platform's environment variables
```

### Issue: "Permission denied" or "Directory not found"

**Solution**: The `bin/release` script now creates the `db` directory automatically.

## 📝 Verify Deployment

After deploying, check:

1. **Database tables exist**: The app should load without "table not found" errors
2. **Homepage loads**: Visit your app URL
3. **Can create posts**: Test the "New Post" functionality
4. **Check logs**: Look for any errors in platform logs

## 🆘 Still Not Working?

1. **Check deployment logs** for the exact error message
2. **Verify environment variables** are set correctly
3. **Run migrations manually** via SSH/Shell
4. **Check database file permissions** (for SQLite)
5. **Consider switching to PostgreSQL** for production (more reliable than SQLite)

## 📞 Next Steps

If you're still having issues, share:
- The exact error message from deployment logs
- Which platform you're deploying to (Render/Railway/Fly.io)
- Whether you've set the environment variables
- The output of running migrations manually

