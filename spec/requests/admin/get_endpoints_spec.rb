# frozen_string_literal: true

require 'spec_helper'

describe 'request to admin endpoints', type: :request do
  describe 'GET /endpoints' do
    before { 5.times { create_any_endpoint } }

    it 'returns all the existing endpoints' do
      get '/endpoints'

      expect(
        JSON.parse(last_response.body)['data'].count
      ).to eq(5)
    end
  end
end
