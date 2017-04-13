# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.4.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Use mysql as the database for Active Record
gem 'mysql2'
# Use Puma as the app server
gem 'puma'
# Multi-environment yaml settings to Rails
gem 'config'

# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# Assets management
gem 'bower-rails'

# The font-awesome font bundled as an asset for the rails asset pipeline
gem 'font-awesome-rails'

# Advanced seed data handling for Rails
gem 'seed-fu'

# AASM - State machines for Ruby classes
gem 'aasm'

# Repository for collecting Locale data for Ruby on Rails I18n
gem 'rails-i18n'

# Authentication
gem 'devise'
gem 'devise-i18n'

# Memoist allows any method to be memoized with just one line of code
gem 'memoist'

# Image uploader
gem 'carrierwave'
gem 'mini_magick'

# Module for the 'fog' gem to support Amazon Web Services
gem 'fog-aws'

# Organise ActiveRecord model into a tree structure
gem 'awesome_nested_set'

# Pagination
gem 'kaminari'

# Forms made easy for Rails! It's tied to a simple DSL, with no opinion on markup.
gem 'simple_form'

# Change language by local
gem 'enum_help'

# Better output in CircleCI
gem 'rspec_junit_formatter'

# Bulk insert for grade model
gem 'activerecord-import'

# Database based asynchronous priority queue system
gem 'daemons'
gem 'delayed_job_active_record'

# Ruby on Rails Error Monitoring & Reporting
gem 'raygun4ruby'

# NewRelic application monitoring
gem 'newrelic_rpm'

# Simple health check of Rails app
gem 'health_check'

# To send parameter from rails controller to javascript file
gem 'gon'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen'
  gem 'web-console'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'

  # Annotate Rails classes with schema and routes info
  gem 'annotate'

  # Better error page for Rack apps
  gem 'better_errors'
  gem 'binding_of_caller'

  # Help to kill N+1 queries and unused eager loading
  gem 'bullet'

  # Used with guard-livereload to automatically update views when they change
  gem 'rack-livereload'

  # Preview mail in the browser instead of sending.
  gem 'letter_opener'

  # Show notification on desktop
  gem 'terminal-notifier'

  # Guard automates tasks by running rules whenever file or directories are modified.
  gem 'guard'
  gem 'guard-bundler', require: false
  gem 'guard-livereload', require: false
  gem 'guard-rspec', require: false
  gem 'guard-rubocop', require: false
  gem 'terminal-notifier-guard'
end

group :test do
  # Code coverage for Ruby 1.9+
  gem 'simplecov', require: false
  # Library for stubbing and setting expectations on HTTP requests in Ruby.
  gem 'webmock'
end

group :development, :test do
  # RSpec
  gem 'database_rewinder'
  gem 'factory_girl_rails'
  gem 'rails-controller-testing'
  gem 'rspec-collection_matchers'
  gem 'rspec-rails'

  # Write helpful info to the log when an ActiveRecord model fails to validate.
  # Mainly to help debug specs.
  gem 'whiny_validation'

  # Step-by-step debugging and stack navigation in Pry
  gem 'pry-byebug'

  # A Rake task that helps you find dead routes and unused actions
  gem 'traceroute'

  # Pretty print your Ruby objects with style -- in full color and with proper
  # indentation
  gem 'awesome_print'

  # Brakeman is an open source static analysis tool which checks Ruby on Rails
  # applications for security vulnerabilities.
  gem 'brakeman', require: false

  # RubyCritic is a gem that wraps around static analysis gems such as Reek,
  # Flay and Flog to provide a quality report of your Ruby code.
  gem 'rubycritic', require: false

  # Rubocop takes care of the quality of the code
  gem 'rubocop', require: false
  gem 'rubocop-rspec'

  # SCSS_lint keeps beautiful scss files
  gem 'scss_lint', require: false

  # A library for generating fake data such as names, addresses, and phone numbers.
  # gem 'faker'

  # Manage translation and localization with static analysis, for Ruby i18n
  gem 'i18n-tasks'
end
