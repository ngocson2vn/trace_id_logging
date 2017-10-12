# TraceIdLogging
This gem provides a Rack middleware and a logger formatter for logging X-Amzn-Trace-Id header for Rails apps deployed on AWS.

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
