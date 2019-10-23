require 'bundler/setup'

# Load GEM dependencies first
Bundler.require(:development, :test)

SimpleCov.start

# Load default config (devise_jwt_controllrs included!)
Bundler.require(:default)

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end