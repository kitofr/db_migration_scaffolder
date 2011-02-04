def database_migration_scaffolder(*args, &block)
  Tasks::DatabaseMigrationScaffolderTask.define_task(*args, &block)
end

module Tasks
  class DatabaseMigrationScaffolderTask < ::Rake::Task
    attr_accessor :database, :name, :format, :content

    def initializer(name=:create_db_migration, taskmanager=nil)
      super(name, taskmanager)
      yield self if block_given?
    end

    def execute(args=nil)
      super(args)
      raise "Need to provide a database and name to create a migration on" unless database && name

      filename = sprintf(format, database, next_migration_number, name)
      puts ">>> Creating migration in #{filename} <<<"
      File.open(filename, 'w') { |f| f.write(content) }
    end

    def database
      @database
    end

    def name
      @name
    end
  
    def content
      @content ||= "-- (Initial file content. Put your create/modify below this line)\n\n--//@UNDO (Place your drop/delete below this line)"
    end

    def format
      @format ||= "./%s/%s %s.sql"
    end

    def as_date!
      @date = true
    end

    private 
    def next_migration_number
      d = Time.now
      return d.strftime("%Y%m%d%H%M%S") if @date
      d.to_i
    end
  end
end

