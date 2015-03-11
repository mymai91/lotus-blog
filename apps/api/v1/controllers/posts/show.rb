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
      #   curl -i -H "Accept: application/json" http://0.0.0.0:2300/api/v1/posts/:id
      #
      #   status
      #   => 200
      #
      class Show
        include ApiV1::Action
        accept :json

        def call(params)
          post = PostRepository.find(params[:id])
          self.body = ApiV1::Presenters::Posts::Show.new(post).render
        end
      end
    end
  end
end

