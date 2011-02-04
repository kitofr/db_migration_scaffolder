require 'tasks/db_migration_scaffolder'

task :default => :migrate

database_migration_scaffolder :migrate, [:database, :name] do |t,args|
  t.database = args.database
  t.name = args.name
  t.format = "db/%s/ChangeScripts/%s %s.sql"
end
