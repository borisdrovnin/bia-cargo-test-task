require 'sinatra/base'

module CargoTask
  module API
    class HTTP < Sinatra::Base
      configure do
        disable :show_exceptions, :raise_errors
        enable :dump_errors
        set :root, $root
        set :bind, ENV['CT_BIND_HOST'] || '0.0.0.0'
        set :port, ENV['CT_PORT'] || '4000'
      end
    end
  end
end
