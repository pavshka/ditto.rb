module Ditto
  module Serializers
    class Error
      include JSONAPI::Serializer

      attributes :code, :detail
    end
  end
end
