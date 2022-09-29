class Sequencer
  class Unit
    module Import
      module Kayako
        module Case
          class Tags < Sequencer::Unit::Common::Model::Tags

            uses :resource

            private

            def tags
              resource['tags']&.map { |tag| tag['name'] }
            end
          end
        end
      end
    end
  end
end
