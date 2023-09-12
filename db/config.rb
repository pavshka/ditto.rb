module Ditto
  module DB
    class Config
      def initialize
        absolute_path = File.expand_path('database.yml', __dir__)
        # Load the database configuration from database.yml
        db_config = YAML.load_file(absolute_path)

        # Set the environment (e.g., 'development', 'test', 'production')
        # You can change this based on your application's needs.
        env = ENV.fetch('RACK_ENV') { 'development' }

        # Establish a Sequel database connection
        @connection = Sequel.connect(db_config[env])
      end

      attr_reader :connection
    end
  end
end
