# frozen_string_literal: true

describe 'request to the Ditto app', type: :request do
  describe 'GET /random' do
    let(:expected_response) { { hello: 'from app' }.to_json }

    it 'returns hello from app' do
      get '/random'

      expect(last_response.body).to eq(expected_response)
    end
  end
end
