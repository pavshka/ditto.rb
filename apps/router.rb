# frozen_string_literal: true

require 'rack'

require_relative 'admin'
require_relative 'main'

module Ditto
  module Apps
    class Router
      def call(env)
        if admin_request?(env)
          run Admin.new
        else
          run Main.new
        end
      end

      private

      def admin_request?(env)
        request = Rack::Request.new(env)
        request.path_info.match?(Admin::PATH_REGEX)
      end
    end
  end
end
