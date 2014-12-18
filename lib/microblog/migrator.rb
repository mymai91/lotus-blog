require_relative '../../config/environment'

module Microblog
  class Migrator
    def self.migrate!
      db = Sequel.connect(ENV['MICROBLOG_DATABASE_URL'])

      db.create_table! :posts do
        primary_key :id
        String :title
        String :content
      end
    end
  end
end
