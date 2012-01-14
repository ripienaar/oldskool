module Oldskool
  class UrlHandler
    include Rack::Utils

    def initialize(params, keyword, config)
      @params = params
      @keyword = keyword
      @config = config
      self
    end

    def handle_request(keyword, query)
      url = @keyword[:url].gsub(/%Q%/, escape_html(query))

      {:template => :redirect, :url => url}
    end
  end
end
