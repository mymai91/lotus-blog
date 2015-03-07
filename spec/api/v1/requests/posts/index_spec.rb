require 'api_helper'

describe 'GET /api/v1/posts' do

  before do
    UserRepository.clear
    PostRepository.clear

    _user = User.new(first_name: 'Trung', last_name: 'Lê', email: 'trung.le@localhost')
    UserRepository.persist(_user)
    @user = UserRepository.last

    _post = Post.new(user_id: @user.id, content: 'lorem ipsum', title: 'lorem ipsum')
    PostRepository.persist(_post)
    @post = PostRepository.last
  end

  it 'returns all posts' do
    get '/api/v1/posts'

    response.status.must_equal 200
    body.must_equal([
      {
        'id' => @post.id,
        'title'=>'lorem ipsum',
        'content'=>'lorem ipsum',
        'user_id'=> @user.id
      }
    ])
  end
end
