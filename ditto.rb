# frozen_string_literal: true

require 'sequel'

DB = Sequel.connect(adapter: 'sqlite', database: 'db/development.sqlite3')

require_relative 'models/response'
require_relative 'models/endpoint'

require_relative 'apps/router'
require_relative 'apps/admin'
require_relative 'apps/main'

module Ditto; end
