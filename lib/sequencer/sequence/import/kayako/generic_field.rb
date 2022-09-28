class Sequencer
  class Sequence
    module Import
      module Kayako
        class GenericField < Sequencer::Sequence::Base

          def self.sequence
            [
              'Import::Kayako::Request',
              'Import::Kayako::Resources',
              'Import::Kayako::Perform',
            ]
          end
        end
      end
    end
  end
end
