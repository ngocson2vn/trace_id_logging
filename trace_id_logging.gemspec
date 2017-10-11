lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trace_id_logging/version'

Gem::Specification.new do |spec|
  spec.name          = 'trace_id_logging'
  spec.version       = TraceIdLogging::VERSION
  spec.authors       = ['Son Nguyen']
  spec.email         = ['nguyen.son@finc.com']

  spec.summary       = 'Logging X-Amzn-Trace-Id header for Rails app deployed on AWS'
  spec.description   = 'This gems provide a Rack middleware and a logger formatter ' \
                       'for logging X-Amzn-Trace-Id header for Rails app deployed on AWS'
  spec.homepage      = 'https://github.com/ngocson2vn/trace_id_logging'
  spec.license       = 'MIT'

  spec.files         = %w(LICENSE.txt) + Dir['lib/**/*.rb']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
