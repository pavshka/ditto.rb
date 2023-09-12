module Ditto
  module Models
    class Response < Sequel::Model
      plugin :validation_helpers

      one_to_one :endpoint

      def validate; end
    end
  end
end
