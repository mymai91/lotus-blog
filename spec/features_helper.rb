# Require this file for feature tests
require 'spec_helper'

require 'capybara'
require 'capybara/dsl'

Capybara.app = Lotus::Container.new

class MiniTest::Spec
  include Capybara::DSL
end
