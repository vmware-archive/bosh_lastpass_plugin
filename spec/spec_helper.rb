ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../Gemfile", __FILE__)

require "rubygems"
require "bundler"
Bundler.setup(:default, :test)

$:.unshift(File.expand_path("../../lib", __FILE__))

require "rspec/core"
require "rspec/its"
require "yaml"
require "erb"
require 'tempfile'

def fixtures name
  File.join(File.dirname(__FILE__), "fixtures", name)
end

def erb_fixtures name
  file = Tempfile.new('bosh_lastpass_plugin')
  file.write(erb_evaluate(fixtures(name)))
  file.close
  file.path
end

def erb_evaluate(filename)
  erb = ERB.new(File.read(filename))
  erb.filename = filename
  erb.result
end
