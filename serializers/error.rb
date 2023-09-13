module Ditto
  module Serializers
    class Error
      include JSONAPI::Serializer

      set_type :errors

      attributes :code, :detail
    end
  end
end
