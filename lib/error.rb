module Ditto
  class Error < StandardError
    attr_reader :code, :detail, :id

    def initialize(code, detail)
      super(detail)
      @code = code
      @detail = detail
      @id = SecureRandom.uuid
    end
  end
end
