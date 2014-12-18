# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage
#
get '/', to: 'posts#index'
resources :posts, only: [:index]
