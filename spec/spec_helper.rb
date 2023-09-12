# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require_relative '../ditto'
require 'net/http'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.before(:each) { clear_database }
end

def clear_database
  %i[responses endpoints].each do |table|
    Database[table].delete
  end
end

def app
  Ditto::Apps::Router.new
end

def create_endpoint_with_response(verb:, path:, response:)
  Database.transaction do
    response = Ditto::Models::Response.create(response)

    endpoint = Ditto::Models::Endpoint.create(verb:, path:, response_id: response.id)

    # Set the foreign key on both models
    response.update(endpoint_id: endpoint.id)
  end
end

def create_any_endpoint
  verb = %w[get post patch delete].sample.upcase
  path = "/#{FFaker::Internet.slug}"
  response = {
    code: Net::HTTPResetContent::CODE_TO_OBJ.keys.sample.to_i,
    headers: { 'Content-Type' => 'application/json' },
    body: { hello: 'world' }.to_s
  }

  create_endpoint_with_response(verb:, path:, response:)
end

def serialized_endpoint(endpoint)
  Ditto::Serializers::Endpoint.new(endpoint).serializable_hash.to_json
end
