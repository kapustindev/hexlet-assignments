# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    # BEGIN
    req = Rack::Request.new(env)
    if req.path == '/'
      [200, {}, ['Hello, World!']]
    elsif req.path == '/about'
      [200, {}, ['About page']]
    else
      [404, {}, ['404 Not Found']]
    end
    # END
  end
end
