require 'net/http'

module Ditto::Factory
  def self.create_endpoint(verb:, path:, response:)
    Database.transaction do
      response = Ditto::Models::Response.create(response)

      endpoint = Ditto::Models::Endpoint.create(verb:, path:, response_id: response.id)

      # Set the foreign key on both models
      response.update(endpoint_id: endpoint.id)
    end
  end

  def self.create_random_endpoint
    verb = random_verb
    path = random_path

    response = {
      code: random_code,
      headers:,
      body: { hello: 'world' }.to_s
    }

    create_endpoint(verb:, path:, response:)
  end

  def self.create_random_get_endpoint
    verb = 'GET'
    path = random_path

    response = {
      code: random_code,
      headers:,
      body: { hello: 'world' }.to_s
    }

    create_endpoint(verb:, path:, response:)
  end

  def self.random_code
    Net::HTTPResetContent::CODE_TO_OBJ.keys.sample.to_i
  end

  def self.random_path
    "/#{FFaker::Internet.slug}"
  end

  def self.random_verb
    %w[get post patch delete].sample.upcase
  end

  def self.headers
    { 'Content-Type' => 'application/json' }.to_json
  end
end
