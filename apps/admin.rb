# frozen_string_literal: true

require 'sinatra/base'

module Ditto
  module Apps
    class Admin < Sinatra::Base
      # /endpoints or /endpoints/1
      PATH_REGEX = %r{^/endpoints($|/\w+$)}

      before { content_type :json }

      get '/endpoints' do
        Ditto::Models::Endpoint.all
      end

      post '/endpoints' do
      end

      patch '/endpoints/:id' do
      end

      delete '/endpoints/:id' do
      end

      private

      def strong_params
        params = params.slice(:id, :verb, :path, :response)
        response = params.delete(:response).slice(:code, :headers, :body) if params[:response]
        params.merge(response:)
      end
    end
  end
end
