module Admin::Controllers::Posts
  class Create
    include Admin::Action

    def call(params)
      @post = Post.new(params[:post])
      PostRepository.persist(@post)

      redirect_to '/admin/posts'
    end
  end
end
