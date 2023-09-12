module Ditto
  module Interactors
    module Endpoints
      class Create
        include Interactor

        def call
          Database.transaction do
            create_response
            create_endpoint
            update_response_foreign_key
          end

          context.endpoint = endpoint
        end

        private

        attr_reader :response, :endpoint

        def create_response
          @response = Ditto::Models::Response.create(context.response_params)
        end

        def create_endpoint
          @endpoint = Ditto::Models::Endpoint.create(
            context.endpoint_params.merge(response_id: response.id)
          )
        end

        def update_response_foreign_key
          response.update(endpoint_id: endpoint.id)
        end
      end
    end
  end
end
