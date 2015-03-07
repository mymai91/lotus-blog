require 'spec_helper'

require 'rack/test'
include Rack::Test::Methods

def app
  @app ||= Lotus::Container.new
end

def response
  last_response
end

def request
  last_request
end

def body
  JSON.parse(response.body)
end
