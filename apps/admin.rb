# frozen_string_literal: true

require 'sinatra/base'

module Ditto
  module Apps
    class Admin < Sinatra::Base
      # /endpoints or /endpoints/1
      PATH_REGEX = %r{^/endpoints($|/\w+$)}

      before { content_type 'application/vnd.api+json' }

      get '/endpoints' do
        result = Interactors::Endpoints::Index.call

        body serialized(result.endpoints, Serializers::Endpoint, { is_collection: true })
        status 200
      end

      post '/endpoints' do
        result = Interactors::Endpoints::Create.call(
          endpoint_params:,
          response_params:
        )

        if result.success?
          body serialized(result.endpoint, Serializers::Endpoint)
          status 201
        else
          body serialized(result.error, Serializers::Error)
          status 422
        end
      end

      patch '/endpoints/:id' do
        status 200
      end

      delete '/endpoints/:id' do
        endpoint = Models::Endpoint.find(id: params[:id])

        if endpoint
          endpoint.delete
          status 204
        else
          status 404
        end
      end

      error do
        env['sinatra.error']
      end

      private

      def serialized(resource, serializer, options = {})
        serializer.new(resource, options).serializable_hash.to_json
      end

      def attributes_params
        params[:data][:attributes]
      end

      # Strong params-like methods
      def endpoint_params
        attributes_params.slice(:id, :verb, :path)
      end

      def response_params
        attributes_params[:response]&.slice(:code, :headers, :body)
      end
    end
  end
end
