require_relative '../../config/environment'

module Microblog
  class Migrator
    def self.migrate!
      db = Sequel.connect(ENV['MICROBLOG_DATABASE_URL'])

      db.create_table! :posts do
        primary_key :id
        String :title
        String :content
        Integer :user_id
        index :user_id
      end

      db.create_table! :users do
        primary_key :id
        String :email
        String :first_name
        String :last_name
        String :password_salt
        String :password_hash
      end
    end
  end
end
