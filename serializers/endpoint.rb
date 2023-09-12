module Ditto
  module Serializers
    class Endpoint
      include JSONAPI::Serializer

      set_type :endpoints
      set_id :id

      attributes :verb, :path

      # TODO: Fix this hack. JSONAPI::Serializer breaks when using Ditto::Serializers::Response
      attribute :response do |object|
        {
          code: object.response.code,
          headers: object.response.headers,
          body: object.response.body
        }
      end
    end
  end
end
