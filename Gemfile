source 'https://rubygems.org'

gem 'draper'
gem 'haml-rails'
gem 'jquery-rails'
gem 'rails', '3.2.9'
gem 'rails3-jquery-autocomplete'
gem 'sass'
gem 'taps'
gem 'thin'

group :assets do
  gem 'sass-rails', '~> 3.2.3'
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'  # for better_errors
  gem 'rspec-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-fchange', require: false  # Filesystem watcher for Guard on Windows
  gem 'rb-fsevent', require: false  # Filesystem watcher for Guard on OS X
  gem 'rb-inotify', require: false  # Filesystem watcher for Guard on Linux
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false, git: 'git://github.com/colszowka/simplecov.git'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'uglifier'
end
