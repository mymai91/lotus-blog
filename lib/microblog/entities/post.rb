require 'lotus/entity'

class Post
  include Lotus::Entity
  attributes :title, :content, :user_id

  # TODO: remove when Lotus support association
  def user=(user)
    self.user_id = user.id
  end

  # TODO: remove when Lotus support association
  def user
    @user ||= UserRepository.find(user_id)
  end
end
