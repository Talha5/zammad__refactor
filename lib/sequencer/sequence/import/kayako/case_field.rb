class Sequencer
  class Sequence
    module Import
      module Kayako
        class CaseField < Sequencer::Sequence::Base

          def self.sequence
            [
              'Common::ModelClass::Ticket',
              'Import::Kayako::ObjectAttribute::Skip',
              'Import::Kayako::ObjectAttribute::SanitizedName',
              'Import::Kayako::ObjectAttribute::Config',
              'Import::Kayako::ObjectAttribute::Add',
              'Import::Kayako::ObjectAttribute::MigrationExecute',
              'Import::Kayako::ObjectAttribute::FieldMap',
            ]
          end
        end
      end
    end
  end
end
