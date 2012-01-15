module Oldskool
  class UrlHandler
    def initialize(params, keyword, config)
      @params = params
      @keyword = keyword
      @config = config
      self
    end

    def handle_request(keyword, query)
      url = @keyword[:url].gsub(/%Q%/, URI.escape(query))

      {:template => :redirect, :url => url}
    end
  end
end
