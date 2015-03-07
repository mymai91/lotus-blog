source 'https://rubygems.org'

ruby '2.2.0'

gem 'bundler'
gem 'rake'

gem 'lotusrb',          github: 'lotus/lotus'
gem 'lotus-view',       github: 'lotus/view'
gem 'lotus-controller', github: 'lotus/controller'
gem 'lotus-helpers',    github: 'lotus/helpers'
gem 'lotus-router',     github: 'lotus/router'
gem 'lotus-model',      github: 'lotus/model'
gem 'lotus-utils',      github: 'lotus/utils'
gem 'bcrypt'
gem 'representative'

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
