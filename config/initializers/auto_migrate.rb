# Auto-migrate on startup if in production/deployment environment
# This is a safety net in case the release command doesn't run
if Rails.env.production? || Rails.env.deployment?
  Rails.application.config.after_initialize do
    begin
      # Check if posts table exists (quick check)
      unless ActiveRecord::Base.connection.table_exists?('posts')
        Rails.logger.info "Posts table not found. Running migrations..."
        ActiveRecord::Base.connection.migration_context.migrate
        Rails.logger.info "Migrations completed successfully!"
      end
    rescue => e
      Rails.logger.error "Failed to auto-migrate: #{e.message}"
      Rails.logger.error e.backtrace.join("\n")
    end
  end
end

