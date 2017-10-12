# TraceIdLogging
This gem provides a Rack middleware and a logger formatter for logging X-Amzn-Trace-Id header for Rails apps deployed on AWS.
### Sample log
```
I, [2017-10-12T02:47:09.293574 #19337]  INFO -- : TRACE_ID:Root=1-59ded7fe-356dfdc6223dd2de48360db9 Started GET "/" for a.b.c.d at 2017-10-12 02:47:09 +0000
I, [2017-10-12T02:47:09.294106 #19337]  INFO -- : TRACE_ID:Root=1-59ded7fe-356dfdc6223dd2de48360db9 Cannot render console from a.b.c.d! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
I, [2017-10-12T02:47:09.295126 #19337]  INFO -- : TRACE_ID:Root=1-59ded7fe-356dfdc6223dd2de48360db9 Processing by ApplicationController#hello as HTML
I, [2017-10-12T02:47:09.295954 #19337]  INFO -- : TRACE_ID:Root=1-59ded7fe-356dfdc6223dd2de48360db9   Rendering html template
I, [2017-10-12T02:47:09.296127 #19337]  INFO -- : TRACE_ID:Root=1-59ded7fe-356dfdc6223dd2de48360db9   Rendered html template (0.0ms)
I, [2017-10-12T02:47:09.296343 #19337]  INFO -- : TRACE_ID:Root=1-59ded7fe-356dfdc6223dd2de48360db9 Completed 200 OK in 1ms (Views: 0.5ms | ActiveRecord: 0.0ms)
```
You can see `TRACE_ID:Root=1-59ded7fe-356dfdc6223dd2de48360db9` is outputted to rails log.

## Installation
- Add the following line to your Rails app's Gemfile
  ```
  gem 'trace_id_logging', '~> 0.0.1', git: 'git@github.com:ngocson2vn/trace_id_logging.git'
  ```

- Install the gem
  ```bash
  bundle install
  ```

## Usage
- Insert the Rack middleware `TraceIdLogging::Middleware` into middleware stack and set logger formatter to `TraceIdLogging::Formatter` by updating `config/environments/<RAILS_ENV>.rb`
  ```ruby
  Rails.application.configure do
    # other configs
    #
    config.logger.formatter = TraceIdLogging::Formatter.new
    config.middleware.insert_after ActionDispatch::RequestId, TraceIdLogging::Middleware
  end
  ```

## Reference
http://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-request-tracing.html

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/trace_id_logging.


## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
