namespace :db do
  desc 'Run migrations'
  task :migrate, [:version] do |_t, args|
    require 'sequel/core'
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    # TODO: изменить на ENV
    Sequel.connect('postgres://cargo_user:123456@localhost/cargo_db') do |db|
      Sequel::Migrator.run(db, 'db/migrations', target: version)
    end
  end
end
