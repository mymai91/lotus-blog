require_relative 'config/boot'
require 'lotus'
require 'lotus/model'

module Blog 
  class Application < Lotus::Application
    configure do
      routes 'config/routes'
      mapping 'config/mapping'

      layout :application

      load_paths << [
        'app/controllers',
        'app/views',
        'app/models'
      ]
    end
  end
end

