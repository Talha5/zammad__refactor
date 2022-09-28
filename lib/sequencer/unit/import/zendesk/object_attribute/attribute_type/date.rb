class Sequencer
  class Unit
    module Import
      module Zendesk
        module ObjectAttribute
          module AttributeType
            class Date < Sequencer::Unit::Import::Zendesk::ObjectAttribute::AttributeType::Base
              def init_callback(_object_attribte)
                @data_option.merge!(
                  future: true,
                  past:   true,
                  diff:   0,
                )
              end
            end
          end
        end
      end
    end
  end
end
