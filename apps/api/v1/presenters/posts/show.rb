require 'representative/json'

module ApiV1
  module Presenters
    module Posts
      class Show
        attr_reader :posts

        def initialize(post)
          @post = post
        end

        def render
          Representative::Json.new do |r|
            r.element :post, @post do
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
