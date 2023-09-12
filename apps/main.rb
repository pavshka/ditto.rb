# frozen_string_literal: true

module Ditto
  module Apps
    class Main
      def call(_env)
        [200, { 'Content-Type' => 'application/json' }, ['{"hello":"from app"}']]
      end
    end
  end
end