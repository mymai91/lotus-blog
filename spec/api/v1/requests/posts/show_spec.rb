require 'api_helper'

describe 'GET /api/v1/posts/1' do

  before do
    UserRepository.clear
    PostRepository.clear

    _user = User.new(first_name: 'Vinh', last_name: 'Nguyen', email: 'vinh.nguyenlexuan@gmail.com')
    UserRepository.persist(_user)
    @user = UserRepository.last

    _post = Post.new(user_id: @user.id, content: 'lorem ipsum', title: 'lorem ipsum')
    PostRepository.persist(_post)
    @post = PostRepository.last
  end

  it 'returns a post details' do
    get "/api/v1/posts/#{@post.id}"

    response.status.must_equal 200
    body.must_equal(
      {
        'id' => @post.id,
        'title'=>'lorem ipsum',
        'content'=>'lorem ipsum',
        'user_id'=> @user.id
      }
    )
  end
end
