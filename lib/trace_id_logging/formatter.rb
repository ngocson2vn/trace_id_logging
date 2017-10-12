require 'logger'

module TraceIdLogging
  class Formatter < Logger::Formatter
    def call(severity, time, progname, msg)
      message = msg2str(msg)
      traceId = Thread.current[:TRACE_ID]
      unless traceId.nil?
        message = "TRACE_ID:#{traceId} #{message}"
      end
      super(severity, time, progname, message)
    end
  end
end
