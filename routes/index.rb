class Application < Sinatra::Base
  get '/' do
    haml :players
    #redirect './autorerun/machines'
  end
end
