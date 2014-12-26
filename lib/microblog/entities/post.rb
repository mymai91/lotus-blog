require 'lotus/entity'

class Post
  include Lotus::Entity
  attributes :title, :content
end
