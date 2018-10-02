require 'yaml'
require 'erb'

env = ENV['RACK_ENV'] || 'development'
config = YAML.safe_load(ERB.new(IO.read("#{$root}/config/database.yml")).result)
DB = Sequel.connect(config[env])
