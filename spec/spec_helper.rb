require_relative 'support/controller_helpers'
require 'devise'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  
  config.include ControllerHelpers, type: :controller
  Warden.test_mode!

  config.after do
    Warden.test_reset!
  end

  config.include Capybara::DSL
end
