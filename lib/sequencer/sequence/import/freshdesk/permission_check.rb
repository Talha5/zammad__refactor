class Sequencer
  class Sequence
    module Import
      module Freshdesk
        class PermissionCheck < Sequencer::Sequence::Base

          def self.expecting
            [:permission_present]
          end

          def self.sequence
            [
              'Freshdesk::PermissionPresent',
            ]
          end
        end
      end
    end
  end
end
