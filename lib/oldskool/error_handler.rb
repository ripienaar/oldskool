module Oldskool
  class ErrorHandler
    def initialize(params, keyword, config)
      @params = params
      @keyword = keyword
      @config = config
      self
    end

    def handle_request(k, q)
      {:template => :error, :error => @keyword[:msg]}
    end
  end
end
