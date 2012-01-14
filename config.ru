$: << File.join(File.dirname(__FILE__), "lib")

require 'oldskool'

set :run, false

config = YAML.load_file(File.expand_path("../config/oldskool.yaml", __FILE__))

# If you want basic HTTP authentication
# include :username and :password in gdash.yaml
if config[:username] && config[:password]
  use Rack::Auth::Basic do |username, password|
    username == config[:username] && password == config[:password]
  end
end

run Oldskool::SinatraApp.new(config)
