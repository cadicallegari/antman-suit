source 'https://rubygems.org'
ruby "2.2.3"

gem 'rails'
# Use postgres as the database for Active Record
gem 'pg'

gem 'rails_12factor', group: :production

gem 'foreman'
gem 'foreman-export-initscript'

gem 'puma'

gem 'grape'
gem 'grape-rabl'

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'better_errors'
  gem 'guard-bundler'
  # gem 'guard-rails'
  gem 'guard-rspec'
  gem "bullet"
  gem 'rubocop', require: false
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
end
