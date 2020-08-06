# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'correios-cep'
gem 'devise'
gem 'jbuilder', '~> 2.7'
gem 'jquery_mask_rails'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2'
gem 'ransack'
gem 'sass-rails', '~> 5'
gem 'turbolinks', '~> 5'
gem 'vcr'
gem 'webmock'
gem 'webpacker', '~> 4.0'
gem 'will_paginate', '~> 3.1.0'
gem 'simplecov', require: false, group: :test
gem 'codecov', require: false, group: :test
gem 'coveralls', require: false

source 'https://rails-assets.org' do
  gem 'rails-assets-jquery'
end

gem 'roo', '~> 2.8.0'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot'
  gem 'ffaker'
  gem 'rspec-rails', '~> 4.0.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry', '~> 0.12.2'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
