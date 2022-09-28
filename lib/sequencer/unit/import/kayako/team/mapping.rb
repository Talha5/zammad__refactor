class Sequencer
  class Unit
    module Import
      module Kayako
        module Team
          class Mapping < Sequencer::Unit::Base
            include ::Sequencer::Unit::Import::Common::Mapping::Mixin::ProvideMapped

            uses :resource

            def process
              provide_mapped do
                {
                  name: resource['title'],
                }
              end
            end
          end
        end
      end
    end
  end
end
