# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "resque_log_error_parser/version"

Gem::Specification.new do |spec|
  spec.name          = "resque_log_error_parser"
  spec.version       = ResqueLogErrorParser::VERSION
  spec.authors       = ["G5 Search Marketing"]
  spec.email         = ["nestor@aelogica.com", "ramon@aelogica.com"]
  spec.description   = %q{Resque worker that parses log files given filters, and executes a callback of your choice.}
  spec.summary       = %q{Resque worker that parses log files given filters, and executes a callback of your choice.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "resque"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "timecop"
end
