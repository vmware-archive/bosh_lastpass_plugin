module Bosh
  module LastpassPlugin
    module YamlReader
      def inject_into_yaml_parsing
        ::BoshExtensions.module_eval do
          def lpass key,type
            `lpass show #{key} --#{type}`
          end
        end
      end
    end
  end
end
