module Oldskool
  module Utils
    include Rack::Utils

    def plugin_template(template, relative)
      File.read(File.expand_path("../../../views/#{template}.erb", relative))
    end
  end
end
