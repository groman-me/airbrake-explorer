require 'sinatra/base'

module AirbrakeExplorer
  class Application < Sinatra::Base
    set :root, ROOT_PATH

    get '/' do
      'Hello world'
    end
  end
end