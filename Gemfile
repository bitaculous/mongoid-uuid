#!/usr/bin/env bundle

source 'https://rubygems.org'

# Declare the gem's dependencies in `mongoid-uuid.gemspec`. Bundler will treat runtime dependencies like base
# dependencies, and development dependencies will be added by default to the `:development` group.
gemspec

# == Development ===

group :development do
  gem 'guard-rspec', '~> 4.6.4', require: false
end

# == Test ===

group :test do
  # --- Database ---

  # gem 'database_cleaner', '~> 1.5.0', require: false
  gem 'database_cleaner', github: 'DatabaseCleaner/database_cleaner', require: false

  # --- Code Analysis ---

  gem 'rubocop',       '~> 0.34.0', require: false
  gem 'rubocop-rspec', '~> 1.3.1',  require: false

  # --- Code coverage ---

  gem 'simplecov', '~> 0.10.0', require: false

  gem 'codeclimate-test-reporter', '~> 0.4.7', require: false

  # --- Formatter ---

  gem 'nyan-cat-formatter', '~> 0.11', require: false
end

# == Misc ===

group :misc do
  gem 'growl', '~> 1.0.3', require: RUBY_PLATFORM.include?('darwin') && 'growl'

  gem 'rb-fsevent', '~> 0.9.6', require: RUBY_PLATFORM.include?('darwin') && 'rb-fsevent'
end