require 'lotus/model/adapters/sql_adapter'

Blog::Application.setup_adapter do
  name     :default
  type     Lotus::Model::Adapters::SqlAdapter
  mapper   :default
  database 'DATABASE_URL'
end
