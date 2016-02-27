source 'https://rubygems.org'
ruby "2.2.3"

gem 'rails'
# Use postgres as the database for Active Record
gem 'pg'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

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
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'spring-commands-rspec'
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
  gem 'selenium-webdriver'
end
