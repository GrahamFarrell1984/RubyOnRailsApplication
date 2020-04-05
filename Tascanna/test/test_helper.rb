require 'simplecov'
SimpleCov.start do
   add_filter 'app/channels'
   add_filter 'app/jobs'
   add_filter 'app/mailers'
end
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  # parallelize(workers: :number_of_processors) This was reducing code coverage percentage since system tests were being run in parallel

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include Devise::Test::IntegrationHelpers # This allows us to use the sign_in method in these tests
end
