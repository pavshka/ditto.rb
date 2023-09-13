# frozen_string_literal: true

# Load Bundler and load all the gems in your Gemfile
require 'bundler/setup'
Bundler.require

# Initialize the database connection
require_relative 'db/config'
Database = Ditto::DB::Config.new.connection

require_relative 'lib/error'

require_relative 'models/response'
require_relative 'models/endpoint'

require_relative 'serializers/endpoint'
require_relative 'serializers/response'
require_relative 'serializers/error'

require_relative 'interactors/endpoints/index'
require_relative 'interactors/endpoints/create'
require_relative 'interactors/endpoints/update'
require_relative 'interactors/endpoints/delete'

require_relative 'apps/admin'
require_relative 'apps/main'
require_relative 'apps/router'
