require "cli/core_ext"
require "cli/validation"

module Bosh
  module LastpassPlugin
    include BoshExtensions
  end
end


require "bosh/lastpass_plugin/version"
require "bosh/lastpass_plugin/additions"
require "bosh/cli/commands/lastpass_plugin"
