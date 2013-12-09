require 'sinatra/base'
require 'airbrake-api'
require 'haml'
require 'pp'

module AirbrakeExplorer
  class Application < Sinatra::Base
    set :root, ROOT_PATH

    helpers Sinatra::ApplicationHelper

    get '/' do
      haml :index, locals: { ab_errors: api.errors(params.slice('project_id')) }
    end

    get '/errors/:error_id' do
      haml :error, locals: { error: api.error(error_id)}
    end

    get '/errors/:error_id/similar_errors/?' do
      haml :similar_errors,
           locals: { notices: filtered_notices}
    end

    get '/errors/:error_id/similar_errors/customize' do
      haml :customize_similars, locals: { hash_info: first_notice(error_id).keys_info }
    end

    protected

    def api
      @api ||= AirbrakeAPI::Client.new AirbrakeExplorer::Config.instance.ab_credentials
    end

    def first_notice(error_id)
      api.notice(api.notices(error_id, raw: true, page: 1).first.id, error_id)
    end

    def filtered_notices
      FilterCollection.new(current_notices).filter(params[:filter])
    end

    def current_notices
      api.notices(error_id, page: params[:page] || 1)
    end

  end
end
