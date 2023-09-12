module Ditto
  module Models
    class Response < Sequel::Model
      plugin :validation_helpers

      one_to_one :endpoint

      def validate; end

      def to_rack_response
        [code, JSON.parse(headers), [body]]
      end
    end
  end
end
