desc 'Application console'
task :console do
  exec 'bundle exec pry -r./application.rb'
end

namespace 'db' do
  desc "Run database migrations"
  task :migrate do
    cmd = "sequel -m db/migrations #{ENV['DATABASE_URL']}"
    puts cmd
    puts `#{cmd}`
  end

  desc 'Zap the database my running all the down migrations'
  task :zap do
    cmd = "sequel -m db/migrations -M 0 #{ENV['DATABASE_URL']}"
    puts cmd
    puts `#{cmd}`
  end

  desc 'Reset the database then run the migrations'
  task :reset => [:zap, :migrate]
end

