class Sequencer
  class Unit
    module Import
      module Freshdesk
        module ObjectAttribute
          class SanitizedName < Sequencer::Unit::Import::Common::ObjectAttribute::SanitizedName
            prepend ::Sequencer::Unit::Import::Common::Model::Mixin::Skip::Action

            skip_any_action

            uses :resource

            private

            def unsanitized_name
              resource['name']
            end
          end
        end
      end
    end
  end
end
