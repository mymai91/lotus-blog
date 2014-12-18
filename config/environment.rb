require 'lotus/setup'
require_relative '../lib/microblog'
require_relative '../apps/web/application'
require_relative '../apps/admin/application'

Lotus::Container.configure do
  mount Web::Application,   at: '/'
  mount Admin::Application, at: '/admin'
end
