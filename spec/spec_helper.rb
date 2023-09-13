# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require_relative '../ditto'

require_relative 'factory'

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

def serialized_endpoint(endpoint)
  Ditto::Serializers::Endpoint.new(endpoint).serializable_hash.to_json
end
