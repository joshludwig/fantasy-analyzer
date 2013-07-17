require 'rake/testtask'
require 'yard'
require 'dm-migrations'

require_relative 'app'

task :default => [:'']

namespace :db do
  desc "Auto migrate the database (destroys data)"
  task :automigrate do
    DataMapper.auto_migrate!
  end

  desc "Auto upgrade the database"
  task :autoupgrade do
    DataMapper.auto_upgrade!
  end
end

YARD::Rake::YardocTask.new do |t|
  t.files   = ['app.rb', '**/helpers/*.rb', '**/routes/*.rb', '**/models/*.rb']
  t.options = ['--protected', '--private']
end

task :coverage do
  system('ruby coverage.rb')
end