module TraceIdLogging
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      traceId = ''
      header = env['HTTP_X_AMZN_TRACE_ID']
      if header && match = header.match(/(Root=\d-[a-z0-9]+-[a-z0-9]+)/)
        traceId = match.captures[0]
      end
      Thread.current[:TRACE_ID] = traceId
      @app.call(env)
    ensure
      Thread.current[:TRACE_ID] = ''
    end
  end
end
