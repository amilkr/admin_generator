# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'admin_generator/version'

Gem::Specification.new do |spec|
  spec.name          = "admin_generator"
  spec.version       = AdminGenerator::VERSION
  spec.authors       = ["Marcos Almonacid"]
  spec.email         = ["marcos@inakanetworks.com"]
  spec.description   = "admin generator gem"
  spec.summary       = "admin generator gem"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails", "3.2.13"
end
