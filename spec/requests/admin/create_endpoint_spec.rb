# frozen_string_literal: true

require 'spec_helper'

describe 'POST /endpoints', type: :request do
  let(:body) do
    '{"data":{"type":"endpoints","attributes":{"verb":"GET","path":"/hello","response":{"code":200,"headers":{"Content-Type":"application/json"},"body":"\"{\"message\":\"Hello,world\"}\""}}}}'
  end
  let(:params) { JSON.parse(body).to_json }

  let(:expected_response) do
    serialized_endpoint(Ditto::Models::Endpoint.first)
  end

  let(:response_headers) { Ditto::Models::Endpoint.first.response.headers }

  it 'returns newly-created endpoint' do
    post('/endpoints', params)

    expect(last_response.body).to eq(expected_response)
  end

  it 'sets proper headers' do
    post('/endpoints', params)

    expect(response_headers).to eq('{"Content-Type":"application/json"}')
  end

  it 'creates new endpoint' do
    expect { post('/endpoints', params) }.to change { Ditto::Models::Endpoint.count }.by(1)
  end
end
