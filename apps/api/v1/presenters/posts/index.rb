require 'representative/json'

module ApiV1
  module Presenters
    module Posts
      class Index
        attr_reader :posts

        def initialize(posts)
          @posts = posts
        end

        def render
          Representative::Json.new do |r|
            r.list_of :posts, posts do
              r.element :id
              r.element :title
              r.element :content
              r.element :user_id
            end
          end.to_s
        end
      end
    end
  end
end
