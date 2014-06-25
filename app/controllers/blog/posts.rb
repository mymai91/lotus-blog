module Blog
  module Controllers
    module Posts
      include Blog::Controller

      action 'Index' do
        expose :posts

        def call(params)
          @posts = ["hello", "world"]
        end
      end
    end
  end
end

