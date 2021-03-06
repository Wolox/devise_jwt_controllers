ENV['RAILS_ENV'] = 'development'

require 'bundler/setup'
require 'rails'

# Load GEM dependencies first
Bundler.require(:development, :test)

require 'rails/config/environment'
require 'rails/config/routes'
require 'rails/db/schema'

require 'rspec/rails'
require 'devise/jwt/test_helpers'

require_relative 'support/shared_contexts'
require_relative 'support/shared_examples'

SimpleCov.start

ActiveRecord::Migration.maintain_test_schema!

# Load default config
Bundler.require(:default)

RSpec.configure do |config|
  config.include ActionDispatch::TestProcess
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include FactoryBot::Syntax::Methods

  Faker::Config.random = Random.new(config.seed)

  config.before(:all) do
    FactoryBot.reload
  end

  config.infer_spec_type_from_file_location!

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before do
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end
