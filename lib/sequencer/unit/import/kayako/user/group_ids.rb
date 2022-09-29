class Sequencer
  class Unit
    module Import
      module Kayako
        module User
          class GroupIds < Sequencer::Unit::Common::Provider::Named

            uses :resource, :id_map

            private

            def group_ids
              Array(resource['teams']).map do |team|
                id_map['Group'][team['id']]
              end
            end
          end
        end
      end
    end
  end
end
