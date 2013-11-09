require 'sinatra/base'

module Sinatra
  module ApplicationHelper
    def error_id
      params['error_id'].to_i
    end

    def pretty_pre_tag(obj)
      text = ''
      PP.pp obj, text
      "<pre><code>#{text}</code></pre>"
    end

    def error_link(error)
      haml_tag :a , {href: "#{current_project}/errors/#{error.id}"} do
        haml_concat error.error_class
      end
    end
  end

  helpers ApplicationHelper
end
