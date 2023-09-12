module Ditto
  module Interactors
    module Endpoints
      class Index
        include Interactor

        def call
          context.endpoints = Models::Endpoint.eager(:response).all
        end
      end
    end
  end
end
