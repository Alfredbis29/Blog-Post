# Auto-migrate on startup if in production/deployment environment
# This is a safety net in case the release command doesn't run
if Rails.env.production? || Rails.env.deployment?
  Rails.application.config.after_initialize do
    begin
      # Ensure db directory exists
      db_dir = Rails.root.join('db')
      FileUtils.mkdir_p(db_dir) unless Dir.exist?(db_dir)
      
      # Check if database file exists
      db_file = ActiveRecord::Base.configurations.configurations.find { |c| c.name == Rails.env.to_s }&.database
      db_path = Rails.root.join(db_file) if db_file
      
      # Check if posts table exists
      unless ActiveRecord::Base.connection.table_exists?('posts')
        Rails.logger.warn "=" * 80
        Rails.logger.warn "Posts table not found. Running migrations automatically..."
        Rails.logger.warn "=" * 80
        
        # Ensure database exists first
        unless db_path && File.exist?(db_path)
          Rails.logger.info "Creating database..."
          ActiveRecord::Base.connection
        end
        
        # Run migrations
        Rails.logger.info "Running migrations..."
        ActiveRecord::Base.connection.migration_context.migrate
        
        Rails.logger.info "=" * 80
        Rails.logger.info "Migrations completed successfully!"
        Rails.logger.info "=" * 80
      else
        Rails.logger.info "Database tables exist. Skipping auto-migration."
      end
    rescue ActiveRecord::NoDatabaseError => e
      Rails.logger.error "Database does not exist. Creating..."
      begin
        ActiveRecord::Base.connection.create_database(ActiveRecord::Base.configurations.configurations.find { |c| c.name == Rails.env.to_s }&.database || 'db/production.sqlite3')
        ActiveRecord::Base.connection.migration_context.migrate
        Rails.logger.info "Database created and migrations completed!"
      rescue => e2
        Rails.logger.error "Failed to create database: #{e2.message}"
      end
    rescue => e
      Rails.logger.error "=" * 80
      Rails.logger.error "Failed to auto-migrate: #{e.class}: #{e.message}"
      Rails.logger.error e.backtrace.first(10).join("\n")
      Rails.logger.error "=" * 80
    end
  end
end

