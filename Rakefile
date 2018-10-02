namespace :db do
  desc 'Run migrations'
  task :migrate, [:version] do |_t, args|
    require 'sequel/core'
    require 'yaml'
    require 'erb'
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    env = ENV['RACK_ENV'] || 'development'
    config = YAML.safe_load(ERB.new(IO.read("#{__dir__}/config/database.yml")).result)
    Sequel.connect(config[env]) do |db|
      Sequel::Migrator.run(db, 'db/migrations', target: version)
    end
  end
end
