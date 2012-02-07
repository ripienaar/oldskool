module Oldskool
  class Router
    def initialize(config)
      @config = config
    end

    def error(msg)
      Oldskool::ErrorHandler.new({}, {:type => :error, :msg => msg}, @config).handle_request(nil, nil)
    end

    def route(params)
      defaulting = false

      k = ""
      q = params[:q].strip

      if params[:q] =~ /^(\w+?)(\s.+)*$/
        k = $1.downcase
        q = $2.strip rescue ""
      end

      default = nil
      handler = nil

      @config[:keywords].each do |keyword|
        default = keyword if [keyword[:keywords]].flatten.include?(:default)

        handler = keyword if [keyword[:keywords]].flatten.include?(k)

        break if handler
      end

      if (!handler && default)
        defaulting = true
        handler = default
      elsif !handler
        return error("No handler for keyword #{k} found and no default handler specified")
      end

      handler_class = "%sHandler" % [handler[:type].to_s.capitalize]

      if Oldskool.constants.map{|k| k.to_s}.include?(handler_class)
        if defaulting
          Oldskool.const_get(handler_class).new(params, handler, @config).handle_request("", params[:q])
        else
          Oldskool.const_get(handler_class).new(params, handler, @config).handle_request(k, q)
        end
      else
        return error("Do not know how to handle type %s keywords" % [ handler[:type] ])
      end
    end
  end
end
