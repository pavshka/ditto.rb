module Ditto
  module Interactors
    module Endpoints
      class Delete
        include Interactor

        delegate :id, to: :context

        def call
          endpoint = Models::Endpoint.find(id:)

          context.fail!(error:) unless endpoint

          endpoint.delete
        end

        private

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
