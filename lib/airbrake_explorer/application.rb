require 'sinatra/base'
require 'airbrake-api'

module AirbrakeExplorer
  class Application < Sinatra::Base
    set :root, ROOT_PATH

    get '/' do
      haml :index, locals: { ab_errors: api.errors }
    end

    get '/errors/:error_id' do
      haml :error, locals: { error: api.error(params['error_id'].to_i)}
    end

    def api
      @api ||= AirbrakeAPI::Client.new AirbrakeExplorer::Config.instance.ab_credentials
    end
  end
end