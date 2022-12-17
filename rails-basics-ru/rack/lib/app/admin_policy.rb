# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    request = Rack::Request.new(env)
    if request.path_info.start_with?('/admin')
      [403, {}]
    else
      @app.call(env)
    end
    # END
  end
end
