# frozen_string_literal: true

module Ditto
  module Apps
    class Main
      def call(env)
        request = Rack::Request.new(env)
        verb = request.request_method.upcase
        path = request.path_info

        endpoint = Ditto::Models::Endpoint.find(verb:, path:)
        return rack_not_found unless endpoint

        endpoint.response.to_rack_response
      end

      private

      def rack_not_found
        [404, { 'Content-Type' => 'application/json' }, ['{"error":"not found"}']]
      end
    end
  end
end
