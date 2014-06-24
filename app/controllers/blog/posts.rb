module Blog
  module Controllers
    module Posts
      include Blog::Controller

      action 'Index' do
        def call(params)
          @posts = []
        end
      end
    end
  end
end

