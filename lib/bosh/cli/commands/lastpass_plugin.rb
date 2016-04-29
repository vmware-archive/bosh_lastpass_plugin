require "bosh/lastpass_plugin"

module Bosh::Cli::Command
  class LastpassPlugin < Base
    include Bosh::LastpassPlugin::Helpers
    extend Bosh::LastpassPlugin::YamlReader

    inject_into_yaml_parsing

    usage "lpass"
    desc "simple BOSH CLI plugin"
    def perform
      say_hello
    end

  end
end
