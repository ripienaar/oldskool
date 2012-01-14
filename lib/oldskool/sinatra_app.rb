module Oldskool
  class SinatraApp < ::Sinatra::Base
    def initialize(config)
      @config = config
      @router = Router.new(config)

      super()
    end

    set :static, true
    set :views, File.join(File.expand_path(File.dirname(__FILE__)), "../..", "views")

    if Sinatra.const_defined?("VERSION") && Gem::Version.new(Sinatra::VERSION) >= Gem::Version.new("1.3.0")
      set :public_folder, File.join(File.expand_path(File.dirname(__FILE__)), "../..", "public")
    else
      set :public, File.join(File.expand_path(File.dirname(__FILE__)), "../..", "public")
    end

    helpers do
      include Rack::Utils

      alias_method :h, :escape_html
    end

    get '/' do
      erb :index
    end

    get '/do' do
      if params[:q]
        @result = @router.route(params)

        @sidemenu = @result.delete(:sidemenu)
        @topmenu = @result.delete(:topmenu)
        @error = @result.delete(:error)

        case (template = @result[:template])
          when :redirect
            redirect @result[:url]
          when nil, :error
            erb :do
          else
            erb template
        end
      end
    end
  end
end
