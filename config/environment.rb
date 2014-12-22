require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'
require_relative '../lib/microblog'
require_relative '../apps/web/application'
require_relative '../apps/admin/application'

# NOTE: the ordering of mounting is important
Lotus::Container.configure do
  mount Admin::Application, at: '/admin'
  mount Web::Application,   at: '/'
end
