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
          body serialized(result.error, Serializers::Error, { is_collection: true })
          status 422
        end
      end

      patch '/endpoints/:id' do
        result = Interactors::Endpoints::Update.call(
          id: params[:id],
          endpoint_params:,
          response_params:
        )

        if result.success?
          body serialized(result.endpoint, Serializers::Endpoint)
          status 201
        else
          body serialized(result.error, Serializers::Error, { is_collection: true })
          status 422
        end
      end

      delete '/endpoints/:id' do
        result = Interactors::Endpoints::Delete.call(id: params[:id])

        if result.success?
          status 204
        else
          body serialized(result.error, Serializers::Error, { is_collection: true })
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

      def json_body
        @json_body ||= JSON.parse(request.body.read, symbolize_names: true)
      end

      def attributes_params
        json_body[:data][:attributes]
      end

      # Strong params-like methods
      def endpoint_params
        attributes_params.slice(:id, :verb, :path)
      end

      # TODO: Fix this headers hack
      def response_params
        response_params = attributes_params[:response]&.slice(:code, :headers, :body)
        response_params[:headers] = response_params[:headers].to_json if response_params[:headers]
        response_params
      end
    end
  end
end
