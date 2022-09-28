class Sequencer
  class Unit
    module Import
      module Kayako
        module ObjectAttribute
          module AttributeType
            class Type < Sequencer::Unit::Import::Kayako::ObjectAttribute::AttributeType::Select
              private

              def options
                super.merge(
                  'Question' => 'Question',
                  'Task'     => 'Task',
                  'Problem'  => 'Problem',
                  'Incident' => 'Incident',
                )
              end
            end
          end
        end
      end
    end
  end
end
