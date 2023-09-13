# frozen_string_literal: true

require 'spec_helper'

describe 'request to mocked endpoints', type: :request do
  context 'when endpoint exists' do
    before { Ditto::Factory.create_random_get_endpoint }

    let(:endpoint) { Ditto::Models::Endpoint.first }

    before { get endpoint.path }

    it 'returns defined status' do
      expect(last_response.status).to eq(endpoint.response.code)
    end

    it 'returns defined headers' do
      expect(last_response.headers).to eq(JSON.parse(endpoint.response.headers))
    end

    it 'returns defined body' do
      expect(last_response.body).to eq(endpoint.response.body)
    end
  end

  context 'when endpoint does not exist' do
    before { get '/hello' }

    it 'returns 404' do
      expect(last_response.status).to eq(404)
    end
  end
end
