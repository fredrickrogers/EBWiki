# frozen_string_literal: true

ruby '2.5.1'

source 'https://rubygems.org'
gem 'dotenv-rails', groups: %i[development test production], require: 'dotenv/rails-now'
gem 'fullcalendar-rails', '~> 3.9'
gem 'rails', '~> 4.2.10'
# Use postgresql as the database for Active Record
gem 'pg', '0.20.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '4.1'

# Reduce N+1 queries
gem 'bullet', '~> 5.7'
# Syntax
gem 'enumerated_type', '~> 0.5'

# Use gem pundit for authorization
gem 'pundit', '~> 2.0.0'
# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 5.1'
# Jquery.turbolinks fixes binded event problems cause by Turbolinks
gem 'jquery-turbolinks', '~> 2.1'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 1.0', group: :doc

gem 'momentjs-rails'
gem 'rack'

# For configurable CORS domain settings
gem 'rack-cors', '~> 1.0', require: 'rack/cors'

# help with charts and graphs
gem 'active_median', '~> 0.1'
gem 'chartkick', '~> 2.3'
gem 'groupdate', '~> 4.0'
gem 'hightop', '~> 0.2'

# Simple Captcha for signing up
gem 'gotcha', '0.0.6'

# xml sitemap
gem 'sitemap_generator', '~> 6.0'

# internal analytics
gem 'ahoy_matey', '2.1'

# use split gem for a/b testing
gem 'split', '3.2', require: 'split/dashboard'

gem 'rollbar', '~> 2.16'

gem 'simplecov', '~> 0.16.1'

# JSON renderer for Rails
gem 'jb', '~> 0.5.0'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'factory_bot_rails', '~> 4.10'
  gem 'faker', '~> 1.9'
  gem 'guard-rspec', '~> 4.7'
  gem 'pry-byebug', '~> 3.6'
  # Reduce N+1 queries
  # gem 'bullet', '~> 5.7'
  # Install a pre-commit hook to enforce code checks before commits
  gem 'pre-commit', '~> 0.38'
  gem 'rspec-rails', '~> 3.8'
end

group :development do
  gem 'brakeman', '~> 4.3', require: false
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.3'
end

group :test do
  # makes it easy to programatically simulate users' interactions
  gem 'capybara', '~> 3.4'
  gem 'cucumber-rails', '~> 1.6', require: false
  gem 'database_cleaner', '~> 1.3.0'
  gem 'launchy', '~> 2.4'
  gem 'selenium-webdriver', '~> 2.43.0'
  gem 'shoulda-matchers', '~> 3.1.1'
  # Confirmation emails sent after commit
  gem 'rubocop-rspec'
  gem 'test_after_commit', '~> 1.1'
  gem 'webmock'
end

gem 'bootstrap-sass'
gem 'bootstrap3-datetimepicker-rails'
gem 'devise', '4.4.3'
gem 'rails_12factor', groups: %i[production staging]
gem 'simple_form'

# for aws cloud storage
gem 'fog', '2.0'
# photo resizing
gem 'mini_magick'
# file upload solution
gem 'carrierwave', '~> 1.2'
# image optimizer that works with carrierwave
gem 'carrierwave-imageoptimizer'

# allow deflated assets with heroku
gem 'heroku_rails_deflate', groups: %i[production staging]

# CMS panel for admin
gem 'rails_admin', '~> 1.3.0'

gem 'geocoder'
gem 'gmaps4rails', '~> 2.1'
gem 'puma'

# implement elasticsearch
gem 'searchkick', '~> 3.1'

# manage nested forms
gem 'cocoon'

# add social share buttons
gem 'social-share-button'

# select tag jquery plugin
gem 'select2-rails', '~> 4.0'

# follower functionality
gem 'acts_as_follower'

# messaging
gem 'mailboxer', '~> 0.12', git: 'https://github.com/lacco/mailboxer.git'

# track changes in model objects
gem 'paper_trail', '~> 9.2.0'

# needed for paper_trail to track changes done via rails_admin views
gem 'paper_trail-association_tracking'

# pretty urls
gem 'friendly_id', '~> 5.2' # Note: You MUST use 5.0.0 or greater for Rails 4.0+

# pagination
gem 'kaminari'

gem 'redis-namespace', '~> 1.6'

# access mailchimp api
gem 'gibbon'

# metatag helper
gem 'metamagic'

# Google News API help
gem 'galerts', '~> 1.1'

gem 'ckeditor', '~> 4.2', git: 'https://github.com/galetahub/ckeditor.git'

# New Relic performance monitor
gem 'newrelic_rpm', '~> 5.2.0'

# for HTTParty
gem 'httparty', '~> 0.16'

# for setting middleware redirects
gem 'rack-host-redirect', '~> 1.3'

gem 'rubocop', '~> 0.58', require: false

# for storing cookies via active record storage to avoid 4kb limit
gem 'activerecord-session_store'
