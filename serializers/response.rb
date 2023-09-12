module Ditto
  module Serializers
    class Response
      include JSONAPI::Serializer

      attributes :code, :headers, :body
    end
  end
end
