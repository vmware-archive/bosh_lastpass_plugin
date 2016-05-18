require "bosh/lastpass_plugin"

module Bosh::Cli::Command
  class LastpassPlugin < Base
    extend Bosh::LastpassPlugin::Additions

    inject_into_yaml_parsing

    usage "lastpass keys"
    desc "simple BOSH CLI plugin"
    def perform
      p "hello"
    end

  end
end
