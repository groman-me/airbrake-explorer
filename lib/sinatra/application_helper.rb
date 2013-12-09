require 'sinatra/base'

module Sinatra
  module ApplicationHelper
    def error_id
      params['error_id'].to_i
    end

    def pretty_tag(obj)
      text = ''
      PP.pp obj, text
      text
    end

    def error_link(error)
      haml_tag :a , {href: "errors/#{error.id}?project_id=#{current_project.id}"} do
        haml_concat error.error_class
      end
    end

    def projects
      @projects ||= api.projects
    end

    def current_project
      return OpenStruct.new unless params['project_id']
      @current_project ||= projects.find { |p| p.id.to_s == params['project_id'] }
    end
  end

  helpers ApplicationHelper
end
