Gem::Specification.new do |s|
  s.rubygems_version = "1.3.7"
  s.name = "db_migration_scaffolder"
  s.version = "0.0.1"
  s.date    = "2011-02-04"
  s.summary = "Database Migration Scaffolder (for the sorry people that doesn't have a proper one)"
  s.description = "The scaffolder mimics the regular rails one and posts new 'sql' files to a specified folder with unique names. The 'number' generated can be as either an integer or a 'date'."
  s.authors = ["Kristoffer Roupé"]
  s.email = "kitofr@gmail.com"
  s.homepage = "http://github.com/kitofr/db_migration_scaffolder"

  s.add_dependency("rake", "~>0.8.7")
  # = MANIFEST =
  s.files = %w[
    README
    Rakefile
    db_migration_scaffolder.gemspec
    tasks/db_migration_scaffolder.rb
  ]
  # = MANIFEST =
end
