ENV['RACK_ENV'] = 'test'
# переопределить api key в тестах чтобы скрыть настоящий
ENV['API_KEY'] = 'test_key'
ENV['CT_LOG_LEVEL'] = 'ERROR'
require 'simplecov'
SimpleCov.start
require 'faker'
require 'factory_bot'
require 'webmock/rspec'
require 'database_cleaner'
require_relative '../app'

Dir[File.expand_path('./support/**/*.rb', __dir__)].each { |f| require f }

RSpec.configure do |config|
  config.include DistanceAPISpecHelper
  config.include FixturesSpecHelper
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)

    FactoryBot.find_definitions
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.default_formatter = 'doc' if config.files_to_run.one?
end
