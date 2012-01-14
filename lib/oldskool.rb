require 'rubygems'
require 'bundler/setup'

module Oldskool
  require 'oldskool/utils'

  Bundler.require(:default)

  require 'oldskool/router'
  require 'oldskool/router'
  require 'oldskool/url_handler'
  require 'oldskool/error_handler'
  require 'oldskool/sinatra_app'

end
