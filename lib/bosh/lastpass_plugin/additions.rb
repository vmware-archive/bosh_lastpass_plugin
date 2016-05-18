module Bosh
  module LastpassPlugin
    module Additions
      def inject_into_yaml_parsing
        ::BoshExtensions.module_eval do
          def lpass key,type
            output = `lpass show #{key} --#{type}`
            if $?.exitstatus != 0
              say "Error: BOSH Lastpass Error failed to fetch #{key}"
              exit($?.exitstatus)
            end
            output
          end
        end
      end
    end
  end
end
