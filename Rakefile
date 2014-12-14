require 'active_record'
require 'yaml'

task :environment do
  ENV['RACK_ENV'] = "test"
  databases = YAML.load_file "config/database.yml"
  ActiveRecord::Base.establish_connection databases[ENV['RACK_ENV']]
end

namespace :db do
  desc "Migrate the database"
  task(:migrate => :environment) do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate("db/migrate")
  end

  desc "Rollback the database"
  task(:rollback => :environment) do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.rollback("db/migrate")
  end
end
