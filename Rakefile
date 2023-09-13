# This gems are required by the Ditto::DB::Config class
require 'yaml'
require 'sequel'
require_relative 'db/config'

namespace :db do
  desc 'Migrate the database'
  task :migrate do
    # Set up your Sequel migration directory (modify as needed)
    Sequel.extension :migration
    Sequel::Migrator.run(Ditto::DB::Config.new.connection, 'db/migrations')
  end

  desc 'Generate file db/schema.rb with the current database schema migration'
  task :schema do
    db = Ditto::DB::Config.new.connection
    db.extension :schema_dumper

    File.write('db/schema.rb', db.dump_schema_migration)
  end
end
# Compare this snippet from db/migrations/001_create_endpoints_table.rb:
