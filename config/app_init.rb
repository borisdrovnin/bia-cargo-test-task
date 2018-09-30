require 'logger'
require 'sequel'

# TODO: изменить на ENV
DB = Sequel.connect("postgres://cargo_user:123456@localhost/cargo_db")

Dir["#{$root}/config/initializers/*.rb"].sort.each { |f| require f }
Dir["#{$root}/lib/cargo_task/api/*.rb"].sort.each { |f| require f }
Dir["#{$root}/lib/cargo_task/models/*.rb"].sort.each { |f| require f }
