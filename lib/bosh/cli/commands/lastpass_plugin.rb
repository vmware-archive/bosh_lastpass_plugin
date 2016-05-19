require "bosh/lastpass_plugin"

module Bosh::Cli::Command
  class LastpassPlugin < Base
    Bosh::LastpassPlugin::Additions.add_lastpass_function

    usage "lastpass keys"
    desc "simple BOSH CLI plugin"
    def perform
      Bosh::LastpassPlugin::Additions.capture!
      
      p "hello"
    end

  end
end
