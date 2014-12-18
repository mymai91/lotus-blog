module Web::Controllers::Posts
  class Show
    include Lotus::Action
    expose :post

    def call(params)
      @post = PostRepository.find(params[:id])
    end
  end
end
