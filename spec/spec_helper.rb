require "bundler/setup"
require "rumanu"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
    # Show the slowest examples
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies
  config.order = :random
  Kernel.srand config.seed

  # Filter lines from Rails gems in backtraces
  config.filter_run_when_matching :focus

  # Use color in STDOUT
  config.color = true

  # Use the specified formatter
  config.formatter = :documentation
end
