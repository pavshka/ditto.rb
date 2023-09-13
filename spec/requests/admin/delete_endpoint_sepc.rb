# frozen_string_literal: true

require 'spec_helper'

describe 'DELETE /endpoints/:id', type: :request do
  context 'when endpoint exists' do
    before { Ditto::Factory.create_random_endpoint }

    let(:id) { Ditto::Models::Endpoint.first.id }

    it 'deletes this endpoint' do
      expect { delete "/endpoints/#{id}" }.to change { Ditto::Models::Endpoint.count }.by(-1)
    end
  end

  context 'when endpoint does not exist' do
    let(:id) { rand(1..100) }

    it 'returns 404' do
      delete "/endpoints/#{id}"

      expect(last_response.status).to eq(404)
    end
  end
end
