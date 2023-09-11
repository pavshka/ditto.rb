# frozen_string_literal: true

require 'rack'

require_relative 'admin'
require_relative 'app'

module Ditto
  class Router
    def call(env)
      if admin_request?(env)
        Admin.new.call(env)
      else
        App.new.call(env)
      end
    end

    private

    def admin_request?(env)
      request = Rack::Request.new(env)
      request.path_info.match?(Admin::PATH_REGEX)
    end
  end
end
