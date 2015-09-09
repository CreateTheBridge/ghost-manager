# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ghost/manager/version'

Gem::Specification.new do |spec|
  spec.name          = "ghost-manager"
  spec.version       = Ghost::Manager::VERSION
  spec.authors       = ["Joshua Tyree"]
  spec.email         = ["joshuat@createthebridge.com"]

  spec.summary       = %q{Ghost manager is a ruby command line utility to manager Ghost installation and theme development}
  spec.description   = %q{Ghost manager is a ruby command line utility to manager Ghost installation and theme development}
  spec.homepage      = "https://github.com/CreateTheBridge/ghost-manager"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["ghost"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "highline", "~> 1.7.3"
end
