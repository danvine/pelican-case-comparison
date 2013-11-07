require 'sinatra'
require 'json'
require 'digest'
require 'pp'

require './lib/pelican/extract'

class App < Sinatra::Base
  get '/' do
    @products = Pelican::extract
    erb :thingiview
  end
end
