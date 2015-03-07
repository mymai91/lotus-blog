module ApiV1
  module Controllers
    module Posts
      ##
      # Return all posts
      #
      # GET /api/v1/posts
      #
      # example:
      #
      #   curl -i -H "Accept: application/json" http://0.0.0.0:2300/api/v1/posts
      #
      #   status
      #   => 200
      #
      class Index
        include ApiV1::Action
        accept :json

        def call(params)
          posts = PostRepository.all
          self.body = ApiV1::Presenters::Posts::Index.new(posts).render
        end
      end
    end
  end
end
