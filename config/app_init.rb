require 'logger'
require 'sequel'
require 'json'
require 'json-schema'
require 'rest-client'

Dir["#{$root}/config/initializers/*.rb"].sort.each { |f| require f }
Dir["#{$root}/lib/cargo_task/models/*.rb"].sort.each { |f| require f }
Dir["#{$root}/lib/cargo_task/services/*.rb"].sort.each { |f| require f }
Dir["#{$root}/lib/cargo_task/api/*.rb"].sort.each { |f| require f }
