require 'simplecov'
SimpleCov.command_name 'minitest'
SimpleCov.start 'rails'

Rails.env = "test"

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/rails"
require "minitest/rails/capybara"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

def sign_in(role = :mod)
  visit user_session_path
  fill_in "Email", with: users(role).email
  fill_in "Password", with: 'password'
  click_button "Sign in"
end
