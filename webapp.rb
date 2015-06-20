require 'sinatra/base'

class WebApp < Sinatra::Base
  get '/' do
    'Hello world!'
  end
end
