require "bosh/lastpass_plugin"

module Bosh::Cli::Command
  class LastpassPlugin < Base
    Bosh::LastpassPlugin::Additions.inject_lastpass

    usage "lastpass show manifest"
    desc "display the manifest with lastpass keys substituted"
    def show_manifest
      deployment_required
      puts ERB.new(File.read(deployment)).result
    end

  end
end
