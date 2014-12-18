module Admin
  class Application < Lotus::Application
    configure do
      root __dir__

      # adapter type: :file_system, uri: ENV['WEB_DATABASE_URL']

      routes  'config/routes'
      # mapping 'config/mapping'

      layout :application

      # cookies true
      sessions :cookie, secret: ENV['WEB_SESSIONS_SECRET']

      # serve_assets true

      load_paths << [
        'controllers',
        'views'
      ]

      # assets << [
      #   'vendor/javascripts'
      # ]

      controller.prepare do
        # ...
      end

      view.prepare do
        # ...
      end
    end

    configure :development do
      handle_exceptions false
      serve_assets      true
    end

    configure :test do
      handle_exceptions false
      serve_assets      true
    end
  end
end
