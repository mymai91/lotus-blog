require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs    << 'spec'
end

task default: :test

namespace :db do
  task :migrate do
    require_relative 'lib/microblog/migrator'
    Microblog::Migrator.migrate!
  end

  task seed: :migrate do
    load 'db/seeds.rb'
  end
end
