require_relative '../../config/environment'

module Microblog
  class Migrator
    require 'sequel'
    Sequel.extension :migration

    def self.migrate!
      db = Sequel.connect(ENV.fetch('MICROBLOG_DATABASE_URL'))
      Sequel::Migrator.run(db, "#{__dir__}/../../db/migrations")
    end
  end
end
