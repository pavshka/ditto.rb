module Ditto
  module Interactors
    module Endpoints
      class Delete
        include Interactor

        delegate :id, to: :context

        def call
          endpoint = Models::Endpoint.find(id:)

          context.fail!(errors:) unless endpoint

          endpoint.delete
        end

        private

        def errors
          [
            Ditto::Error.new(404, "Endpoint with id #{id} not found")
          ]
        end
      end
    end
  end
end
