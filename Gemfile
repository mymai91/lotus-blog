source 'https://rubygems.org'

ruby '2.2.0'

gem 'bundler'
gem 'rake'

gem 'lotusrb', '0.2.0'
gem 'lotus-model', '0.2.0'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', require: false
end

group :production do
  gem 'foreman'
  gem 'pg'
  gem 'puma'
end

group :test do
  gem 'minitest'
  gem 'capybara'
end
