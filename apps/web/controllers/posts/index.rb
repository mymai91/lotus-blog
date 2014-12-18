module Web::Controllers::Posts
  class Index
    include Lotus::Action
    expose :posts

    def call(params)
      @posts = PostRepository.all
    end
  end
end
