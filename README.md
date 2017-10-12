# TraceIdLogging
This gem provides a Rack middleware and a logger formatter for logging X-Amzn-Trace-Id header for Rails apps deployed on AWS.
## Sample log
```
I, [2017-10-12T02:47:09.293574 #19337]  INFO -- : TRACE_ID:Root=1-59ded7fe-356dfdc6223dd2de48360db9 Started GET "/" for 39.110.203.172 at 2017-10-12 02:47:09 +0000
I, [2017-10-12T02:47:09.294106 #19337]  INFO -- : TRACE_ID:Root=1-59ded7fe-356dfdc6223dd2de48360db9 Cannot render console from a.b.c.d! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
I, [2017-10-12T02:47:09.295126 #19337]  INFO -- : TRACE_ID:Root=1-59ded7fe-356dfdc6223dd2de48360db9 Processing by ApplicationController#hello as HTML
I, [2017-10-12T02:47:09.295954 #19337]  INFO -- : TRACE_ID:Root=1-59ded7fe-356dfdc6223dd2de48360db9   Rendering html template
I, [2017-10-12T02:47:09.296127 #19337]  INFO -- : TRACE_ID:Root=1-59ded7fe-356dfdc6223dd2de48360db9   Rendered html template (0.0ms)
I, [2017-10-12T02:47:09.296343 #19337]  INFO -- : TRACE_ID:Root=1-59ded7fe-356dfdc6223dd2de48360db9 Completed 200 OK in 1ms (Views: 0.5ms | ActiveRecord: 0.0ms)
```
You can see `TRACE_ID:Root=1-59ded7fe-356dfdc6223dd2de48360db9` is outputted to rails log.

# Installation
- Add the following line to your Rails app's Gemfile
  ```
  gem 'trace_id_logging', '~> 0.0.1', git: 'git@github.com:ngocson2vn/trace_id_logging.git'
  ```

- Install the gem
  ```bash
  bundle install
  ```

- Insert the Rack middleware `TraceIdLogging::Middleware` into middleware stack and set logger formatter to `TraceIdLogging::Formatter` by updating `config/environments/<RAILS_ENV>.rb`
  ```ruby
  Rails.application.configure do
    # other configs
    #
    config.logger.formatter = TraceIdLogging::Formatter.new
    config.middleware.insert_after ActionDispatch::RequestId, TraceIdLogging::Middleware
  end
  ```
