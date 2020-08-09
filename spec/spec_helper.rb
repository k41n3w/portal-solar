# frozen_string_literal: true

require 'factory_bot'
require 'simplecov'
require 'codecov'

SimpleCov.start 'rails' do
  add_filter 'app/channels'
  add_filter 'app/mailers'
  add_filter 'app/jobs'
  add_filter 'spec'
end

SimpleCov.minimum_coverage 95

SimpleCov.formatter = SimpleCov::Formatter::Codecov if ENV['CI'] == 'true'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
