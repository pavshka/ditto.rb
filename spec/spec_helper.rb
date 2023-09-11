# frozen_string_literal: true

require 'rspec'
require 'rack/test'

require_relative '../ditto'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

def app
  Ditto::Router.new
end
