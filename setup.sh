echo "Setting this up ..."
bundle install
bundle exec rake db:migrate

echo "Setup complete. Please run 'bundle exec lotus server' to start the server"