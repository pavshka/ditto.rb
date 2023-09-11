# frozen_string_literal: true

require 'sinatra/base'

module Ditto
  class Admin < Sinatra::Base
    # /endpoints or /endpoints/1
    PATH_REGEX = %r{^/endpoints($|/\w+$)}

    before { content_type :json }

    get '/endpoints' do
      { hello: 'from admin' }.to_json
    end

    post '/endpoints' do
    end

    patch '/endpoints/:id' do
    end

    delete '/endpoints/:id' do
    end
  end
end
