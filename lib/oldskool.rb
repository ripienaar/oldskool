require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

module Oldskool
  require 'oldskool/version'
  require 'oldskool/router'
  require 'oldskool/router'
  require 'oldskool/url_handler'
  require 'oldskool/error_handler'
  require 'oldskool/sinatra_app'
end
