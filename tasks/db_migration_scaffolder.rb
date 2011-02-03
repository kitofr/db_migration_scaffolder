def database_migration_scaffolder(*args, &block)
  Tasks::DatabaseMigrationScaffolderTask.define_task(*args, &block)
end

module Tasks
  class DatabaseMigrationScaffolderTask < ::Rake::Task
    attr_accessor :database, :name

    def initializer(name=:create_db_migration, taskmanager=nil)
      super(name, taskmanager)
      yield self if block_given?
    end

    def execute(args=nil)
      super(args)
      raise "Need to provide a database and name to create a migration on" unless database && name

      puts "Creating migration in db/#{database}/ChangeScripts/#{next_migration_number} #{name}.sql"
    end

    def database
      @database
    end

    def name
      @name
    end

    private 
    def next_migration_number
      d = Time.now
      d.strftime("%Y%m%d%H%M%S")
    end
  end
end

