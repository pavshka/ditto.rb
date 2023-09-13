# frozen_string_literal: true

require 'spec_helper'

describe 'GET /endpoints', type: :request do
  before { 5.times { Ditto::Factory.create_random_endpoint } }

  it 'returns all the existing endpoints' do
    get '/endpoints'

    expect(
      JSON.parse(last_response.body)['data'].count
    ).to eq(5)
  end
end
