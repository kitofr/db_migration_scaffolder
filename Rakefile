require 'tasks/db_migration_scaffolder'

task :default => :migrate

database_migration_scaffolder :migrate, [:database, :name] do |t,args|
  t.database = args.database#"PanelManagement"
  t.name = args.name#"Crazy renaming migration"
end
