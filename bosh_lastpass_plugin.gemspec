# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bosh/lastpass_plugin/version'

Gem::Specification.new do |spec|
  spec.name          = "bosh_lastpass_plugin"
  spec.version       = Bosh::LastpassPlugin::VERSION
  spec.authors       = ["Jatin Naik"]
  spec.email         = ["jsnaik@gmail.com"]
  spec.description   = %q{Short description.}
  spec.summary       = %q{Short description.}
  spec.homepage      = "https://github.com/cloudfoundry/bosh"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_runtime_dependency "bosh_cli",  ">= 1.2682.0"
  spec.add_runtime_dependency "bosh_common",  ">= 1.2682.0"
  spec.add_runtime_dependency "semi_semantic", "~> 1.1.0"
  spec.add_runtime_dependency "membrane", "~> 1.1.0"
  spec.add_runtime_dependency "git", "~> 1.2.6"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec", "~> 3.1.0"
  spec.add_development_dependency "rspec-its", '~> 1.1.0'
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "bosh_cli"
end
