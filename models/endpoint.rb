module Ditto
  module Models
    class Endpoint < Sequel::Model
      plugin :validation_helpers

      one_to_one :response

      def validate
        super
        validates_presence %i[verb path]
        validates_unique %i[verb path]
      end
    end
  end
end
