# frozen_string_literal: true

require "rails"
require "langchainrb_rails"
require "rails/generators"
require "rails/generators/test_case"
require "generator_spec"
require "langchainrb_rails/helpers"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include Helpers::FileSystem
end
