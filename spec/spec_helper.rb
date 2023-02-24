require 'bundler/setup'
require 'rest-client'
require 'json'
require 'webmock/rspec'

# Require everything in 'lib'
Dir['lib/**/*.rb'].each do |f|
  require './' + f
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
