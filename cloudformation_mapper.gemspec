# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloudformation_mapper/version'

Gem::Specification.new do |spec|
  spec.name          = "cloudformation_mapper"
  spec.version       = CloudformationMapper::VERSION
  spec.authors       = ["Instructure"]
  spec.summary       = %q{OO mapping for cloudformation}
  spec.description   = %q{OO mapping for cloudformation}
  spec.homepage      = %q{http://github.com/instructure/cloudformation_mapper}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "aws-sdk", "~> 2.0.10.pre"
  spec.add_dependency "activesupport", "~> 4.1"
  spec.add_dependency "highline", "~> 1.6"
  spec.add_dependency "cloudformation-ruby-dsl"
  spec.add_dependency "json"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "byebug"
end
