require 'rubygems'
require 'bundler/setup'

require 'rails'
require 'active_model'

require 'rspec'
require 'simplecov'

# SimpleCov is a code coverage analysis tool for Ruby.
::SimpleCov.start { add_filter %r{^/spec/} }

require ::File.expand_path('../lib/errors-renderer', __dir__)

RSpec.configure do |config|
  # Limits the available syntax to the non-monkey patched syntax.
  config.disable_monkey_patching!

  # This setting enables warnings.
  config.warnings = true

  # Run specs in random order to surface order dependencies.
  config.order = :random
end
