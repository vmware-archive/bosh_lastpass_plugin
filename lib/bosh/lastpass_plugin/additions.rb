module Bosh
  module LastpassPlugin
    module Additions
      def capture!
        @capture_only = true
      end

      def capture?
        @capture_only || false
      end

      def fetch_passwords(key,type)
        output = `lpass show #{key} --#{type}`
        if $?.exitstatus != 0
          say "Error: BOSH Lastpass Error failed to fetch #{key}"
          exit($?.exitstatus)
        end
        output
      rescue Errno::ENOENT => e
        say "Error: BOSH Lastpass Error lastpass cli not found"
        say "Error: Get cli from https://github.com/lastpass/lastpass-cli and ensure its in the PATH"
        say "Error: #{e}"
        exit($?.exitstatus)
      end

      def capture_keys key, type
        @keys ||= {}
        ``
      end

      def add_lastpass_function
        ::BoshExtensions.module_eval do
          def lpass key,type
            if capture?
              fetch_passwords(key,type)
            else
              capture_keys(key, type)
            end
          end
        end
      end
    end
  end
end
