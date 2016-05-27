module Bosh
  module LastpassPlugin
    module Additions
      def self.inject_lastpass
        ::BoshExtensions.module_eval do
          def lpass key,type
            output = `lpass show #{key} --#{type}`
            if $?.exitstatus != 0
              say "Error: BOSH Lastpass Error failed to fetch #{key}"
              say "Error: #{output}"
              exit($?.exitstatus)
            end
            output
          rescue Errno::ENOENT => e
            say "Error: BOSH Lastpass Error lastpass cli not found"
            say "Error: Get cli from https://github.com/lastpass/lastpass-cli and ensure its in the PATH"
            say "Error: #{e}"
            exit($?.exitstatus)
          end
        end
      end
    end
  end
end
