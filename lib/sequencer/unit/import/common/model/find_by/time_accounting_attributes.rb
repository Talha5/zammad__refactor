class Sequencer
  class Unit
    module Import
      module Common
        module Model
          module FindBy
            class TimeAccountingAttributes < Sequencer::Unit::Import::Common::Model::Lookup::CombinedAttributes

              private

              def attributes
                %i[ticket_id created_by_id created_at]
              end
            end
          end
        end
      end
    end
  end
end
