require 'lotus/setup'
require_relative '../lib/microblog'
require_relative '../apps/web/application'

Lotus::Container.configure do
  mount Web::Application, at: '/'
end
