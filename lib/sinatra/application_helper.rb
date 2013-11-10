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
      haml_tag :a , {href: "errors/#{error.id}"} do
        haml_concat error.error_class
      end
    end
  end

  helpers ApplicationHelper
end
