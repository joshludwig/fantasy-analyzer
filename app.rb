require 'rubygems'
require 'bundler'


Bundler.require

require_relative 'routes/init'
require_relative 'lib/init'
require_relative 'models/init'

class Application < Sinatra::Base
  enable :method_override
  configure do
    set :app_file, __FILE__
    set :port, 1337
    set :bind, '0.0.0.0'
  end

  configure :development do
    DataMapper::Logger.new($stdout, :debug)
    DataMapper.setup(:default, 'postgres://score:score@localhost:5432/ScoreAnalyzer')
    DataMapper.finalize
    register Sinatra::Reloader
    set :reload_paths, ['routes/**/*.rb', 'lib/**/*.rb']
    set :logger_level, :debug
    enable :logging, :dump_errors, :raise_errors
  end

  run! if app_file == $0

end

