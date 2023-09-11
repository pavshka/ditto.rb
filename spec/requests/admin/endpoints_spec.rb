# frozen_string_literal: true

require 'spec_helper'

describe 'request to admin endpoints', type: :request do
  describe 'GET /endpoints' do
    let(:expected_response) { { hello: 'from admin' }.to_json }

    it 'returns hello from admin' do
      get '/endpoints'

      expect(last_response.body).to eq(expected_response)
    end
  end
end
