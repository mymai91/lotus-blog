echo "Setting this up ..."
bundle install
bundle exec rake db:migrate
bundle exec rake db:seed

echo "Setup complete. Please run 'bundle exec lotus server' to start the server"