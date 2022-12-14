class Sequencer
  class Unit
    module Import
      module Zendesk
        module ObjectAttribute
          module AttributeType
            class Multiselect < Sequencer::Unit::Import::Zendesk::ObjectAttribute::AttributeType::Select
              def data_type(_attribute)
                'multiselect'
              end
            end
          end
        end
      end
    end
  end
end
