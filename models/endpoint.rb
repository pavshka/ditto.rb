module Ditto
  module Models
    class Endpoint < Sequel::Model
      plugin :validation_helpers

      one_to_one :response

      def validate; end
    end
  end
end
