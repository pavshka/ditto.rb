module Ditto
  module Interactors
    module Endpoints
      class Update
        include Interactor

        delegate :id, :endpoint_params, :response_params, to: :context

        def call
          endpoint = Models::Endpoint.find(id:)

          context.fail!(error:) unless endpoint

          Database.transaction do
            update_endpoint(endpoint_params, endpoint) if endpoint_params
            update_response(response_params, endpoint.response) if response_params
          end
        end

        private

        def update_endpoint(params, endpoint)
          endpoint.update(params)
        end

        def update_response(params, response)
          response.update(params)
        end

        def error
          {
            code: 'not_found',
            detail: "Endpoint with id #{id} not found"
          }
        end
      end
    end
  end
end
